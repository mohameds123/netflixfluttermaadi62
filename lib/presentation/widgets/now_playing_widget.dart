import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/txt.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 370,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 15,
            itemBuilder: (context, index) {
              return Image.asset("assets/images/nowplayingtest.png");
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 280, left: 90),
          child: Row(
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: ColorsManager.red,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              SizedBox(width: 6),
              Text(
                Txt.nowPlaying,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: ColorsManager.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
