import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../domain/entites/movie_entity.dart';

class MoviePage extends StatelessWidget {
  final MovieEntity movie;

  const MoviePage(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 400),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  movie.backdropImageUrl,
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
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(onPressed: Modular.to.pop, icon: const Icon(Icons.keyboard_arrow_left)),
                ),
                Padding(
                  padding: const EdgeInsets.all(9),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      movie.title,
                      softWrap: true,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.description),
                movie.isAdult ? const Text("+18") : Container(),
                Text('Genres: ${movie.genresList.join(', ')}'),
                Text('Popularity: ${movie.popularity.toString()}'),
                Text('Realese: ${movie.releaseDate.year.toString()}'),
                Text('Vote avarage: ${movie.voteAvarage.toString()}'),
                Text('Total votes: ${movie.voteCount.toString()}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
