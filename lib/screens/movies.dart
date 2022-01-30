// ignore_for_file: unused_field, prefer_final_fields
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../../utils/services.dart';
import '../../widgets/movies/special_list.dart';
import '../../widgets/movies/trending_list.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    futureSpecialMovie = fetchSpecialMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpecialList(
                current: _current,
                futureSpecialMovie: futureSpecialMovie,
                carouselController: _carouselController,
              ),
              TrendingList(
                futureTrendingMovie: futureSpecialMovie,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
