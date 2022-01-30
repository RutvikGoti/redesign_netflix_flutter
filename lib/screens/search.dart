import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../utils/services.dart';
import '../../widgets/home/search_bar.dart';
import '../../widgets/search/search_list.dart';

class SearchScreen extends StatefulWidget {
  final String query;

  const SearchScreen({Key? key, required this.query}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    futureSearchMovie = fetchSearchMovie(widget.query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SearchBar(),
            SearchList(futureSearchMovie: futureSearchMovie),
          ],
        ),
      ),
    );
  }
}
