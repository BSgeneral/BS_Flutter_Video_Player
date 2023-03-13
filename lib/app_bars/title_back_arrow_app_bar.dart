import 'package:flutter/material.dart';

class TitleBackArrowAppBar extends StatelessWidget {
  final String title;
  final Icon appBarIcon;
  final Function onAppBarIconTapped;
  final bool isTitleHasTwoLines;
  final bool isAppIconCircle;

  const TitleBackArrowAppBar(
      {super.key,
      required this.title,
      required this.appBarIcon,
      required this.onAppBarIconTapped,
      required this.isTitleHasTwoLines,
      required this.isAppIconCircle});

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
        child: const Icon(Icons.arrow_back),
      ),
      expandedHeight: isTitleHasTwoLines ? 150.0 : 110.0,
      collapsedHeight: 100.0,
      elevation: 0.0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              onAppBarIconTapped();
            },
            child: isAppIconCircle
                ? CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color(0xffF5F5F5),
                    child: appBarIcon,
                  )
                : appBarIcon,
          ),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Color(0xFF253861),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
        titlePadding: const EdgeInsetsDirectional.only(
          start: 20,
          bottom: 5,
        ),
        centerTitle: false,
        stretchModes: [],
      ),
    );
  }
}
