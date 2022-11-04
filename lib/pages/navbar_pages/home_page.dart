// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/widget/large_text.dart';

import '../../widget/small_text.dart';
import '../../widget/tap_barview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    TabController _controller = TabController(length: 3, vsync: this);
    List images = [
      'hiking.png',
      'kayaking.png',
      'snorkling.png',
      'balloning.png'
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.menu),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.mainColor,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: LargeText(text: 'Discover')),
            const SizedBox(
              height: 20,
            ),
            TabBarContainer(controller: _controller),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: LargeText(
                    text: 'Explore More',
                    size: 20,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SmallText(
                    text: 'See All',
                    textColor: AppColors.textColor2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(
                                  'img/' + images[index],
                                ),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Text('Kayyo'),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
