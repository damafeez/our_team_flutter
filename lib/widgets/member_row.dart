import 'package:flutter/material.dart';
import 'package:our_team/models/members.dart';
import 'package:our_team/resources/colors.dart';
import 'package:our_team/resources/sizes.dart';
import 'package:our_team/widgets/member_image.dart';

class MemberRow extends StatelessWidget {
  Member member;
  MemberRow({@required this.member});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          MemberImage(member.imagePath),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  member.name.replaceAll(new RegExp(' '), '\n').toUpperCase(),
                  style: TextStyle(
                      fontSize: AppFont.md,
                      fontWeight: FontWeight.w800,
                      color: primaryText,
                      height: 1.1),
                ),
                SizedBox(
                  height: AppSpace.sm,
                ),
                Text(
                  member.role,
                  style: TextStyle(
                      fontSize: AppFont.sm,
                      fontWeight: FontWeight.w800,
                      color: secondaryText),
                ),
              ],
            ),
          )
        ]));
  }
}
