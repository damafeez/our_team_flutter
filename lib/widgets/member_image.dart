import 'package:flutter/material.dart';
import 'package:our_team/resources/sizes.dart';

class MemberImage extends StatelessWidget {
  bool compact;
  bool active;
  String imagePath;
  MemberImage(this.imagePath, {this.compact = false, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(imagePath),
          colorFilter: active ? ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.colorBurn) : null,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: compact ? Colors.black.withOpacity(.2) : Color.fromRGBO(181, 197, 220, 0.9),
            blurRadius: 15,
            offset: Offset(10.0, 7.0),
          )
        ],
      ),
      width: compact ? AppSpace.xl : 100.0,
      height: compact ? 95 : 145.0,
    );
  }
}
