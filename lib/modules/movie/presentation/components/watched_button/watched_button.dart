import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../infra/i_storages/i_movies_watched_local_storage.dart';
import '../watched_count/watched_count_cubit/watched_count_cubit.dart';

class WatchedButton extends StatefulWidget {
  const WatchedButton({
    super.key,
    required this.id,
    required this.isWatched,
  });

  final bool isWatched;
  final int id;

  @override
  State<WatchedButton> createState() => _WatchedButtonState();
}

class _WatchedButtonState extends State<WatchedButton> with AutomaticKeepAliveClientMixin {
  final countCubit = Modular.get<WatchedCountCubit>();
  final watchedStore = Modular.get<IMoviesWatchedLocalStorage>();
  late bool isPressed;

  @override
  bool get wantKeepAlive => true;

  @override
  initState() {
    super.initState();
    isPressed = widget.isWatched;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return IconButton(
      onPressed: () async {
        if (isPressed == false) {
          countCubit.increment();
          watchedStore.put(widget.id, true);
        } else {
          countCubit.decrement();
          watchedStore.put(widget.id, false);
        }
        setState(() {
          isPressed = !isPressed;
        });
      },
      color: Theme.of(context).colorScheme.onPrimary,
      splashRadius: 15,
      icon: isPressed ? const Icon(Icons.check_circle) : const Icon(Icons.check_circle_outline),
    );
  }
}
