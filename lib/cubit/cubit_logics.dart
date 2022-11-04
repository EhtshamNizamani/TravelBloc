import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/pages/details_page.dart';
import 'package:travelapp/pages/navbar_pages/home_page.dart';
import 'package:travelapp/pages/welcome.dart';

class CubitLogics extends StatefulWidget {
  const CubitLogics({Key? key}) : super(key: key);

  @override
  State<CubitLogics> createState() => _CubitLogicsState();
}

class _CubitLogicsState extends State<CubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitState>(builder: (context, state) {
      if (state is WelcomeState) {
        return const WelcomeScreen();
      }
      if (state is LoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is DetailState) {
        return const DetailsPage();
      }
      if (state is LoadedState) {
        return const HomePage();
      } else {
        return Container();
      }
    }));
  }
}
