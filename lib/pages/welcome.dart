// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/widget/large_text.dart';
import 'package:travelapp/widget/responsive_button.dart';
import 'package:travelapp/widget/small_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List image = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "img/" + image[index],
                    ),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 150.0, left: 20, right: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LargeText(text: 'Trips'),
                          SmallText(
                            text: 'Mountain',
                            size: 30,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 250,
                            child: SmallText(
                                text:
                                    'Mountain hikes give you an incredible sense of freedom along with endurance tests'),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              return BlocProvider.of<AppCubits>(context)
                                  .getDataList();
                            },
                            child: ResponsiveButton(
                              isResponsive: false,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexOfList) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            width: 8,
                            height: index == indexOfList ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: indexOfList == index
                                    ? AppColors.mainColor
                                    : AppColors.mainColor.withOpacity(0.3)),
                          );
                        }),
                      )
                    ]),
              ),
            );
          }),
    );
  }
}
