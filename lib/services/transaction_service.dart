import 'package:airplane/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      await _transactionReference.add({
        'destination': transaction.destination.toMap(),
        'amountOfTraveler': transaction.amountOfTraveler,
        'selectedSeats': transaction.selectedSeats,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
        'vat': transaction.vat,
        'refundable': transaction.refundable,
        'insurance': transaction.insurance,
      });

    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchDestinations() async {
    try {
      QuerySnapshot result = await _transactionReference.get();
      List<TransactionModel> transactions = result.docs.map((e) {
        return TransactionModel.fromMap(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return transactions;
    } catch (e) {
      throw e;
    }
  }
  
}