import 'dart:developer';
import 'package:defi_app/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';

Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString('assets/abi.json');
  String contractAddress = contractAddress1;
  final contract = DeployedContract(ContractAbi.fromJson(abi, 'Splitwise'),
      EthereumAddress.fromHex(contractAddress));
  return contract;
}

Future<String> callFunction(String funcname, List<dynamic> args,
    Web3Client ethClient, String privateKey) async {
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(funcname);
  final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
          maxGas: 100000,
          contract: contract,
          function: ethFunction,
          parameters: args),
      chainId: null,
      fetchChainIdFromNetworkId: true);
  return result;
}

Future<String> createGroup(String title, List<String> participants,
    List<BigInt> debt, Web3Client ethClient) async {
  var response = await callFunction(
      'createGroup', [title, participants, debt], ethClient, ownerPrivateKey);
  if (kDebugMode) {
    print('Group created successfully');
  }
  return response;
}

Future<String> createExpense(String title, String payer, String groupName,
    int amt, List<int> debt, Web3Client ethClient) async {
  var response = await callFunction('createExpense',
      [title, payer, groupName, amt, debt], ethClient, ownerPrivateKey);
  if (kDebugMode) {
    print('Expense created successfully');
  }
  return response;
}

Future<String> createPayment(String payer, String payee, String groupName,
    int amt, List<int> debt, Web3Client ethClient) async {
  var response = await callFunction('createPayment',
      [payer, payee, groupName, amt, debt], ethClient, ownerPrivateKey);
  if (kDebugMode) {
    print('Payment created successfully');
  }
  return response;
}

Future<List<dynamic>> ask(
    String funcName, List<dynamic> args, Web3Client ethClient) async {
  final contract = await loadContract();
  final ethFunction = contract.function(funcName);
  List<dynamic> result = await ethClient.call(
      contract: contract, function: ethFunction, params: args);
  return result;
}

Future<List> readGroups(Web3Client ethClient) async {
  log('read groups called');
  List<dynamic> response = await ask(
    'readGroups',
    [],
    ethClient,
  );
  log(response[0]);
  if (kDebugMode) {
    print('Groups read successfully');
  }
  return response;
}

Future<String> readExpenses(Web3Client ethClient) async {
  var response =
      await callFunction('readExpenses', [], ethClient, ownerPrivateKey);
  if (kDebugMode) {
    print('Expenses read successfully');
  }
  return response;
}
