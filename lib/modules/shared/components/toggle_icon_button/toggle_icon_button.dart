import 'package:flutter/material.dart';

class ToggleIconButton extends StatefulWidget {
  const ToggleIconButton({
    Key? key,
    required this.inactiveIcon,
    required this.activeIcon,
    required this.isActive,
  }) : super(key: key);

  final Icon inactiveIcon;
  final Icon activeIcon;

  final bool isActive;

  @override
  State<ToggleIconButton> createState() => _ToggleIconButtonState();
}

class _ToggleIconButtonState extends State<ToggleIconButton> with AutomaticKeepAliveClientMixin {
  late bool isPressed;

  @override
  bool get wantKeepAlive => true;

  @override
  initState() {
    super.initState();
    isPressed = widget.isActive;
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
      icon: isPressed ? widget.activeIcon : widget.inactiveIcon,
    );
  }
}
