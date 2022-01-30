// ignore_for_file: unnecessary_null_comparison, must_be_immutable

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/movie.dart';
import '../../widgets/loading.dart';
import '../../widgets/search/search_item.dart';

class SearchList extends StatefulWidget {
  late Future<Movie> futureSearchMovie;

  SearchList({
    Key? key,
    required this.futureSearchMovie,
  }) : super(key: key);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3500,
      color: kBackgroundColor,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: FutureBuilder<Movie>(
        future: widget.futureSearchMovie,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Result> snapshots = snapshot.data!.results!;
            return Container(
              height: 3400,
              color: kBackgroundColor,
              child: GridView.builder(
                controller: _scrollController,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 350,
                ),
                itemCount: snapshots.length,
                itemBuilder: (context, index) {
                  final data = snapshots[index];
                  return SearchItem(data: data, index: index);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 250),
                Text('${snapshot.error}', style: kErrorText),
              ],
            );
          }

          return Scaffold(
            backgroundColor: kBackgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(height: 250),
                Loading(
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
