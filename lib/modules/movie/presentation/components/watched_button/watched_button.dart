import 'package:flutter/material.dart';

class WatchedButton extends StatefulWidget {
  const WatchedButton(
    this.isWatched, {
    super.key,
  });

  final bool isWatched;

  @override
  State<WatchedButton> createState() => _WatchedButtonState();
}

class _WatchedButtonState extends State<WatchedButton> with AutomaticKeepAliveClientMixin {
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
      onPressed: () {
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
