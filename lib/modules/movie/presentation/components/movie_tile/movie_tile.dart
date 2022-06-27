import 'package:flutter/material.dart';

import '../../../domain/entites/movie_entity.dart';
import '../watched_button/watched_button.dart';

class MovieTile extends StatelessWidget {
  const MovieTile(this.entity, {Key? key}) : super(key: key);

  final MovieEntity entity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(entity.posterImageUrl, height: 100),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(entity.title),
                Row(
                  children: [
                    Text(entity.releaseDate.year.toString()),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text(entity.genresList.join(', '), overflow: TextOverflow.ellipsis),
                    ),
                  ],
                )
              ],
            ),
          ),
          WatchedButton(entity.isWatched),
        ],
      ),
    );
  }
}
