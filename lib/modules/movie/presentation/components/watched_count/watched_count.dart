import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'watched_count_cubit/watched_count_cubit.dart';

class WatchedCount extends StatelessWidget {
  WatchedCount({
    Key? key,
    required this.actual,
    required this.total,
  }) : super(key: key);

  final int total;
  final int actual;

  final countCubit = Modular.get<WatchedCountCubit>();
  @override
  Widget build(BuildContext context) {
    countCubit.setInitialValue(actual);

    return StreamBuilder<Object>(
        stream: countCubit.stream,
        initialData: countCubit.state,
        builder: (context, snapshot) {
          return Row(
            children: [
              (snapshot.data == 0)
                  ? const Icon(Icons.circle_outlined)
                  : (snapshot.data == total)
                      ? const Icon(Icons.circle)
                      : const Icon(CupertinoIcons.circle_lefthalf_fill),
              const SizedBox(width: 5),
              Text('${snapshot.data} of $total watched'),
            ],
          );
        });
  }
}
