import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';

import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/widget/large_text.dart';
import 'package:travelapp/widget/list_button.dart';
import 'package:travelapp/widget/responsive_button.dart';
import 'package:travelapp/widget/small_text.dart';

import '../cubit/app_cubit_state.dart';
import '../model/data_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, CubitState>(
      builder: (context, state) {
        if (state is DetailState) {
          final DataModel data = state.place;
          return SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            'http://mark.bslmeiyu.com/uploads/${data.img}',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white70,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white70,
                            )),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 30, right: 20, left: 20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    height: MediaQuery.of(context).size.height * 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LargeText(
                              text: data.name,
                              size: 25,
                            ),
                            LargeText(
                              text: data.price.toString(),
                              size: 25,
                              textColor: AppColors.textColor2,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            SmallText(
                              text: data.location,
                              size: 12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(5, (index) {
                              return index >= data.stars!
                                  ? const Icon(
                                      Icons.star_border,
                                      color: AppColors.starColor,
                                    )
                                  : const Icon(
                                      Icons.star,
                                      color: AppColors.starColor,
                                    );
                            })),
                            const SizedBox(
                              width: 10,
                            ),
                            SmallText(text: data.stars.toString()),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        LargeText(
                          text: 'People',
                          size: 20,
                        ),
                        SmallText(text: 'Number of people in you group'),
                        const SizedBox(
                          height: 15,
                        ),
                        Wrap(
                          children: List.generate(
                            data.people!,
                            (index) {
                              return AppButton(
                                index: index,
                                isIcon: false,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LargeText(
                          text: 'Description',
                          size: 20,
                        ),
                        SmallText(
                          text: data.description,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButton(index: 0, isIcon: true),
                            ResponsiveButton(
                              width: 220,
                              text: " Book Trip Now",
                              isResponsive: true,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
