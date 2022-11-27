import 'package:defi_app/model/payment.dart';
import 'package:defi_app/model/transaction.dart';

class Group {
  final List<String> participants;
  final List<double> debt;
  final String groupTitle;
  final List<Transaction> transactions;
  final List<Payment> expenses;

  Group(this.debt, this.groupTitle, this.participants, this.transactions,
      this.expenses);
}
