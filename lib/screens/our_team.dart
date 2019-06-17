import 'package:flutter/material.dart';
import 'package:our_team/models/members.dart';
import 'package:our_team/resources/colors.dart';
import 'package:our_team/resources/sizes.dart';
import 'package:our_team/widgets/member_row.dart';

class OurTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: secondaryText,
          size: AppFont.lg,
        ),
        title: Text(
          'Our Team',
          style: TextStyle(
            color: primaryText,
            fontWeight: FontWeight.w700,
            fontSize: AppFont.lg,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: background,
      ),
      body: Container(
        color: background,
        child: ListView.separated(
          padding: EdgeInsets.only(
            top: AppSpace.md,
            bottom: AppSpace.md,
            left: AppSpace.xl,
            right: AppSpace.md,
          ),
          itemCount: members.length,
          itemBuilder: (BuildContext context, int index) {
            return MemberRow(
              member: members[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: AppSpace.md,
              ),
        ),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}