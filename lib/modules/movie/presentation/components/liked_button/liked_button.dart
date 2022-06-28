import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../infra/i_storages/i_lists_liked_local_storage.dart';

class LikedButton extends StatefulWidget {
  const LikedButton({
    super.key,
    required this.id,
    required this.isLiked,
  });

  final bool isLiked;
  final int id;

  @override
  State<LikedButton> createState() => _LikedButtonState();
}

class _LikedButtonState extends State<LikedButton> with AutomaticKeepAliveClientMixin {
  final likedStore = Modular.get<IListsLikedLocalStorage>();
  late bool isPressed;

  @override
  bool get wantKeepAlive => true;

  @override
  initState() {
    super.initState();
    isPressed = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return IconButton(
      onPressed: () async {
        if (isPressed == false) {
          likedStore.put(widget.id, true);
        } else {
          likedStore.put(widget.id, false);
        }
        setState(() {
          isPressed = !isPressed;
        });
      },
      color: Theme.of(context).colorScheme.onPrimary,
      splashRadius: 15,
      icon: isPressed ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
    );
  }
}
