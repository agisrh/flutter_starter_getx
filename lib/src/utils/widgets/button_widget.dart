import 'package:flutter/material.dart';
import '../styles/style_helper.dart';

class Button extends StatelessWidget {
  final String txtButton;
  final Color color;
  final GestureTapCallback onPressed;
  final bool disable;
  final double width;
  final double padding;

  const Button({
    Key? key,
    required this.onPressed,
    required this.txtButton,
    required this.color,
    this.disable = false,
    this.width = double.infinity,
    this.padding = 8.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: disable ? AppColors.form : color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
    return SizedBox(
      width: width,
      child: TextButton(
        style: flatButtonStyle,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                txtButton,
                maxLines: 1,
                style: TextStyle(
                  color: disable ? const Color(0xFF9FA5C0) : Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          if (!disable) {
            onPressed();
          }
        },
      ),
    );
  }
}

class ButtonDefault extends StatelessWidget {
  final String txtButton;
  final GestureTapCallback onPressed;
  final double width;

  const ButtonDefault(
      {Key? key,
      required this.onPressed,
      required this.txtButton,
      this.width = double.infinity})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: AppColors.form,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
    return SizedBox(
      width: width,
      child: TextButton(
        style: flatButtonStyle,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                txtButton,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  final String txtButton;
  final Color color;
  final GestureTapCallback onPressed;
  final double width;
  final Widget icon;

  const ButtonIcon(
      {Key? key,
      required this.onPressed,
      required this.txtButton,
      required this.color,
      this.width = double.infinity,
      required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
    return SizedBox(
      width: width,
      child: TextButton(
        style: flatButtonStyle,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(child: icon),
              const SizedBox(width: 8),
              Text(
                txtButton,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}

class ButtonOutline extends StatelessWidget {
  final String txtButton;
  final Color color;
  final Color colorLabel;
  final GestureTapCallback onPressed;
  final bool disable;
  final double width;
  final double padding;

  const ButtonOutline({
    Key? key,
    required this.onPressed,
    required this.txtButton,
    required this.color,
    this.disable = false,
    this.colorLabel = Colors.black,
    this.width = double.infinity,
    this.padding = 8.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      //backgroundColor: disable ? AppColors.form : color,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        side: BorderSide(
            color: disable ? const Color(0xFFD0DBEA) : color, width: 1.5),
      ),
    );
    return SizedBox(
      width: width,
      child: TextButton(
        style: flatButtonStyle,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                txtButton,
                maxLines: 1,
                style: TextStyle(
                  color: disable ? const Color(0xFFD0DBEA) : colorLabel,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          if (!disable) {
            onPressed();
          }
        },
      ),
    );
  }
}

class ButtonSM extends StatelessWidget {
  final String txtButton;
  final Color color;
  final GestureTapCallback onPressed;
  final bool disable;

  const ButtonSM({
    Key? key,
    required this.onPressed,
    required this.txtButton,
    required this.color,
    this.disable = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: disable ? AppColors.form : color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
    return TextButton(
      style: flatButtonStyle,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              txtButton,
              maxLines: 1,
              style: TextStyle(
                color: disable ? Colors.black38 : Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        if (!disable) {
          onPressed();
        }
      },
    );
  }
}

Widget btnNavbar({required Widget icon, required String title}) {
  return Column(
    children: [
      IconButton(
        onPressed: () {},
        iconSize: 27.0,
        icon: icon,
      ),
      Text(title),
    ],
  );
}
