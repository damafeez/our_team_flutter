import 'package:flutter/material.dart';
import 'package:our_team/resources/sizes.dart';

class MemberImage extends StatelessWidget {
  bool compact;
  String imagePath;
  MemberImage(this.imagePath, {this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: compact ? AppSpace.sm : AppSpace.md),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(181, 197, 220, 0.9),
            blurRadius: 15,
            offset: Offset(10.0, 7.0),
          )
        ],
      ),
      width: compact ? 65 : 100.0,
      height: compact ? 95 : 145.0,
    );
  }
}
