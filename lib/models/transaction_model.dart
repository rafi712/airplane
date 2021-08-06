import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:airplane/models/destination_model.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationModel destination;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final int price;
  final int grandTotal;
  final int amountOfTraveler;
  final double vat;

  TransactionModel({
    required this.destination,
    this.id = '',
    this.selectedSeats = '',
    this.insurance = false,
    this.refundable = false,
    this.price = 0,
    this.grandTotal = 0,
    this.amountOfTraveler = 0,
    this.vat = 0,
  });

  @override
  List<Object> get props {
    return [
      destination,
      selectedSeats,
      insurance,
      refundable,
      price,
      grandTotal,
      amountOfTraveler,
      vat,
    ];
  }

  factory TransactionModel.fromMap(String id, Map<String, dynamic> map) {
    return TransactionModel(
      destination: DestinationModel.fromMap(map['destination']['id'], map['destination']),
      id: id,
      selectedSeats: map['selectedSeats'],
      insurance: map['insurance'],
      refundable: map['refundable'],
      price: map['price'],
      grandTotal: map['grandTotal'],
      amountOfTraveler: map['amountOfTraveler'],
      vat: map['vat'],
    );
  }
}
