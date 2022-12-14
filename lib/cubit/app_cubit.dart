// ignore_for_file: avoid_print

import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:bloc/bloc.dart';
import 'package:travelapp/model/data_model.dart';
import 'package:travelapp/services/data_services.dart';

class AppCubits extends Cubit<CubitState> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getDataList() async {
    try {
      emit(LoadingState());

       places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  void getData(DataModel data) {
    print(data);
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
