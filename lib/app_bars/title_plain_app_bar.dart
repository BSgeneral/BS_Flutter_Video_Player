import 'package:flutter/material.dart';

class TitlePlainAppBar extends StatelessWidget {
  final String title;
  final Icon appBarIcon;
  final Function onAppBarIconTapped;
  final bool isTitleHasTwoLines;

  const TitlePlainAppBar(
      {super.key,
      required this.title,
      required this.appBarIcon,
      required this.onAppBarIconTapped,
      required this.isTitleHasTwoLines});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      automaticallyImplyLeading: true,
      expandedHeight: isTitleHasTwoLines ? 150.0 : 110.0,
      collapsedHeight: 100.0,
      elevation: 0.0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Color(0xFF555C62)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              onAppBarIconTapped();
            },
            child: appBarIcon,
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
