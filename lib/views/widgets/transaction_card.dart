import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/booking_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    image: DecorationImage(
                      image: NetworkImage(transaction.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        transaction.destination.location,
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_star.png'),
                        ),
                      ),
                    ),
                    Text(
                      transaction.destination.rating.toString(),
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),                
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            BookingDetailsItem(
              title: 'Traveler', 
              valueColor: blackColor, 
              valueText: '${transaction.amountOfTraveler} Person',
            ),
            BookingDetailsItem(
              title: 'Seat', 
              valueColor: blackColor, 
              valueText: transaction.selectedSeats,
            ),
            BookingDetailsItem(
              title: 'Insurance', 
              valueColor: transaction.insurance ? greenColor : redColor, 
              valueText: transaction.insurance ? 'YES' : 'NO',
            ),
            BookingDetailsItem(
              title: 'Refundable', 
              valueColor: transaction.refundable ? greenColor : redColor, 
              valueText: transaction.refundable ? 'YES' : 'NO',
            ),
            BookingDetailsItem(
              title: 'VAT', 
              valueColor: blackColor, 
              valueText: '${(transaction.vat * 100).toInt()}%',
            ),
            BookingDetailsItem(
              title: 'Price', 
              valueColor: blackColor, 
              valueText: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(transaction.price),
            ),
            BookingDetailsItem(
              title: 'Grand Total', 
              valueColor: primaryColor, 
              valueText: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(transaction.grandTotal),
            ),
          ],
        ),
      );
  }
}