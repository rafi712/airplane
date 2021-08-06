import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  final String id;
  final bool isAvailable;
  const SeatItem({this.isAvailable = true, required this.id});

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    Color backgroundColor() {
      if (!isAvailable) return unavailableColor;
      if (isSelected) return primaryColor;
      return availableColor;
    }

    Color borderColor() {
      if (isAvailable) return primaryColor;
      return unavailableColor;
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor(),
            width: 2
          ),
        ),
        child: !isSelected ? null : Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontWeight: semibold,
            ),
          ),
        ),
      ),
    );
  }
}
