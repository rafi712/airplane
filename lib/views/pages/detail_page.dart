import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/custom_scroll_config.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/widgets/custom_button.dart';
import 'package:airplane/views/widgets/interest_item.dart';
import 'package:airplane/views/widgets/photo_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;

  const DetailPage(this.destination);

  @override
  Widget build(BuildContext context) {

    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.55,
        decoration: BoxDecoration(              
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(destination.imageUrl),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.4, 1],
              colors: [
                whiteColor.withOpacity(0),
                Colors.black.withOpacity(0.95),
              ],
            ),
          ),
        ),
      );
    }

    Widget content() {
      return SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: CustomScrollConfig(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // !TODO: EMBLEM
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 108,
                    height: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icon_emblem.png'),
                      ),
                    ),
                  ),
                  // !TODO: TITLE BAR
                  Container(
                    // margin: EdgeInsets.only(top: 256),
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.55 - 208), 										
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                destination.name,
                                style: whiteTextStyle.copyWith(
                                  fontSize: 24,
                                  fontWeight: semibold,
                                ),
                              ),
                              Text(
                                destination.location,
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
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
                              destination.rating.toString(),
                              style: whiteTextStyle.copyWith(
                                fontWeight: semibold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // !TODO: ABOUT
                        Text(
                          'About',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Berada di jalur provinsi yang menghubungkan Denpasar '
                          'Singaraja serta letaknya yang dekat dengan Kebun Raya'
                          ' Eka Karya menjadikannya tempat Bali.',
                          style: blackTextStyle.copyWith(
                            height: 2,
                          ),
                        ),
                        SizedBox(height: 20),
                        // !TODO: PHOTOS
                        Text(
                          'Photos',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            PhotoItem('assets/image_photo1.png'),
                            PhotoItem('assets/image_photo2.png'),
                            PhotoItem('assets/image_photo3.png'),
                          ],
                        ),
                        SizedBox(height: 20),
                        // !TODO: INTEREST
                        Text(
                          'Interest',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            InterestItem(label: 'Kids Park'),
                            InterestItem(label: 'Honor Bridge'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            InterestItem(label: 'City Museum'),
                            InterestItem(label: 'Centrall Mall'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    width: double.infinity,
                    child: Row(
                      children: [
                        // !TODO: PRICE
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                ).format(destination.price),
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: semibold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'per orang',
                                style: greyTextStyle.copyWith(
                                  fontWeight: light,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // !TODO: BOOK BUTTON
                        Expanded(
                          child: CustomButton(
                            // width: 170,
                            text: 'Book Now',
                            onPressed: () {
                              Navigator.pushNamed(
                                context, '/choose-seat', arguments: destination,
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          backgroundImage(),
          content(),
        ],
      ),
    );
  }
}

