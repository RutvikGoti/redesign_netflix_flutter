// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:redesign_netflix_flutter/models/movie.dart';

import '../loading.dart';
import 'special_item.dart';

class SpecialList extends StatelessWidget {
  int current;
  final Future<Movie> futureSpecialMovie;
  final CarouselController carouselController;

  SpecialList(
      {Key? key,
      required this.current,
      required this.futureSpecialMovie,
      required this.carouselController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<Movie>(
          future: futureSpecialMovie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SpecialItem(
                current: current,
                snapshot: snapshot,
                futureSpecialMovie: futureSpecialMovie,
                carouselController: carouselController,
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const Loading(
              padding: EdgeInsets.symmetric(vertical: 143),
            );
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
