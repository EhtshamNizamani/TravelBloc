// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/misc/colors.dart';

import '../model/data_model.dart';

class TabBarContainer extends StatelessWidget {
  TabController controller;

  TabBarContainer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitState>(builder: (context, state) {
      if (state is LoadedState) {
        List<DataModel> places = state.places;
        return Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  controller: controller,
                  labelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const CircleTabIndicator(
                      color: AppColors.mainColor, radius: 4.0),
                  tabs: const [
                    Tab(
                      text: 'Place',
                    ),
                    Tab(
                      text: 'Insperation',
                    ),
                    Tab(
                      text: 'Emotions',
                    ),
                  ]),
            ),
            SizedBox(
              height: 270,
              width: double.infinity,
              child: TabBarView(controller: controller, children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: places.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              BlocProvider.of<AppCubits>(context).getData(
                            places[index],
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(top: 20, left: 15),
                            height: 250,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'http://mark.bslmeiyu.com/uploads/${places[index].img}',
                                    ),
                                    filterQuality: FilterQuality.low,
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(child: Text('There')),
                const SizedBox(child: Text('By')),
              ]),
            ),
          ],
        );
      } else {
        return Container();
      }
    });
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CircelPainter(color: color, radius: radius);
  }
}

class _CircelPainter extends BoxPainter {
  final Color color;
  final double radius;
  _CircelPainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // ignore: no_leading_underscores_for_local_identifiers
    Paint _paint = Paint();

    _paint.color = color;
    _paint.isAntiAlias = true;
    final circleOffset = Offset(configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
