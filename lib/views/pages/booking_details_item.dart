import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class BookingDetailsItem extends StatelessWidget {
  final String title, valueText;
  final Color valueColor;

  const BookingDetailsItem({
    required this.title,
    required this.valueText,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle,
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              valueText,
              textAlign: TextAlign.end,
              style: blackTextStyle.copyWith(
                fontWeight: semibold,
                color: valueColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
