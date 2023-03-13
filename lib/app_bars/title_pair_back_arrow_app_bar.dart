import 'package:flutter/material.dart';

class TitlePairBackArrowAppbar extends StatelessWidget {
  final String title;
  final String subTitle;
  final Icon appBarIcon;
  final Function onAppBarIconTapped;
  final bool isTitleHasTwoLines;
  final bool isTitleLong;

  const TitlePairBackArrowAppbar(
      {super.key, required this.title,
      required this.subTitle,
      required this.appBarIcon,
      required this.onAppBarIconTapped,
      required this.isTitleHasTwoLines,
      this.isTitleLong = false});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      automaticallyImplyLeading: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back,
          color: Color(0xFF253861),
        ),
      ),
      expandedHeight: isTitleHasTwoLines ? 170.0 : 150.0,
      collapsedHeight: 100.0,
      elevation: 0.0,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          title,
                          style:  TextStyle(
                              color: const Color(0xFF253861),
                              fontSize: isTitleLong ? 20.0 : 23.0,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0, bottom: 0),
                          child: GestureDetector(
                            onTap: () {
                              onAppBarIconTapped();
                            },
                            child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: const Color(0xFFBDBDBD),
                                    width: 1.0,
                                  ),
                                ),
                                child: appBarIcon),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(
                        color: Color(0xFF808191),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
        titlePadding:
            const EdgeInsetsDirectional.only(start: 20, bottom: 0, end: 20.0),
        centerTitle: false,
        stretchModes: [],
      ),
    );
  }
}
