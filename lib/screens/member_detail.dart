import 'package:flutter/material.dart';
import 'package:our_team/models/members.dart';
import 'package:our_team/resources/sizes.dart';
import 'package:our_team/widgets/member_image.dart';

class MemberDetail extends StatefulWidget {
  int currentIndex;
  MemberDetail({@required this.currentIndex});

  @override
  _MemberDetailState createState() => _MemberDetailState();
}

class _MemberDetailState extends State<MemberDetail> {
  int _currentIndex;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    Future.delayed(Duration.zero, _callAfterBuild);
  }

  void _callAfterBuild() {
    final double _memberImageOffset = 
      (widget.currentIndex + 1)
      * (AppSpace.xl + AppSpace.sm - 3) //imagewidth + separatorWidth
      + AppSpace.xl //scroller paddingLeft
      - MediaQuery.of(context).size.width; // screenwidth

    if (_memberImageOffset > 0) {
      _scrollController.animateTo(
        _memberImageOffset,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 100),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Member member = members[_currentIndex];
    return Scaffold(
      body: Stack(children: <Widget>[
        SizedBox.expand(
          child: Container(
            padding: EdgeInsets.only(bottom: AppSpace.sm),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(member.imagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken),
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: AppSpace.xl,
                        left: AppSpace.xl,
                        right: AppSpace.lg,
                      ),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              member.formattedName(),
                              style: TextStyle(
                                  fontSize: AppFont.xl,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white.withOpacity(0.9),
                                  height: 0.9),
                            ),
                            SizedBox(
                              height: AppSpace.sm,
                            ),
                            Text(
                              member.role,
                              style: TextStyle(
                                fontSize: AppFont.md - 1.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            SizedBox(
                              height: AppSpace.xl,
                            ),
                            Text(
                              member.description,
                              style: TextStyle(
                                fontSize: AppFont.md - 2.0,
                                color: Colors.white.withOpacity(0.8),
                                height: 1.3,
                              ),
                            ),
                            SizedBox(
                              height: AppSpace.xl,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: AppSpace.xl,
                      top: AppSpace.md,
                      bottom: AppSpace.md,
                    ),
                    child: Text(
                      'OUR TEAM MEMBERS',
                      style: TextStyle(
                        fontSize: AppFont.sm + 2,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withOpacity(0.9),
                        height: 1.3,
                      ),
                    ),
                  ),
                  Container(
                    height: AppSpace.lg + 75,
                    child: ListView.separated(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(
                          left: AppSpace.xl, right: AppSpace.md),
                      itemCount: members.length,
                      itemBuilder: (BuildContext context, int index) {
                        var active = index == _currentIndex;
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              MemberImage(
                                members[index]?.imagePath,
                                compact: true,
                                active: active,
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              Container(
                                height: 5.0,
                                width: 5.0,
                                decoration: BoxDecoration(
                                  color: Colors.white
                                      .withOpacity(active ? .8 : 0.0),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                            width: AppSpace.sm - 3,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: AppSpace.xl,
          right: AppSpace.md,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.close,
              size: AppSpace.lg,
              color: Colors.white54,
            ),
          ),
        ),
      ]),
    );
  }
}
