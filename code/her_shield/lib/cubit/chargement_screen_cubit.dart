import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'chargement_screen_state.dart';

class ChargementScreenCubit extends Cubit<ChargementScreenState> {
  ChargementScreenCubit() : super(ChargementScreenInitial()) {
    Timer(const Duration(seconds: 1), () {
      emit(ChargementScreenChargement());
    });
  }
}
