import 'package:flutter/material.dart';

import '../liked_button/liked_button.dart';
import '../watched_count/watched_count.dart';

class MovieListHeader extends StatelessWidget {
  const MovieListHeader(
      {super.key,
      required this.listName,
      required this.imageUrl,
      required this.likeCount,
      required this.isLiked,
      required this.numberOfMovies,
      required this.numberOfWatchedMovies,
      required this.id});

  final String listName;
  final String imageUrl;
  final int likeCount;
  final int numberOfMovies;
  final int numberOfWatchedMovies;
  final int id;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 400),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              return loadingProgress == null ? child : const Center(child: CircularProgressIndicator());
            },
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: const [.2, 1],
                  colors: [Theme.of(context).canvasColor, Colors.transparent],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(listName)),
                    LikedButton(isLiked: isLiked, id: id),
                  ],
                ),
                Row(
                  children: [
                    Text('$likeCount likes'),
                    const SizedBox(width: 10),
                    WatchedCount(actual: numberOfWatchedMovies, total: numberOfMovies),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
