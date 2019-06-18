import 'package:flutter/material.dart';
import 'package:our_team/models/members.dart';
import 'package:our_team/resources/colors.dart';
import 'package:our_team/resources/sizes.dart';
import 'package:our_team/screens/member_detail.dart';
import 'package:our_team/widgets/member_image.dart';

class MemberRow extends StatelessWidget {
  int index;
  MemberRow({@required this.index});

  @override
  Widget build(BuildContext context) {
    Member member = members[index];
    return InkWell(
        onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MemberDetail(currentIndex: index,)))
            },
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MemberImage(member.imagePath),
              SizedBox(width: AppSpace.md,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      member.formattedName(),
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
