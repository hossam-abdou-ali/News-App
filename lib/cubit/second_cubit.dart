import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubit/state.dart';

class modecubit extends Cubit<modestate> {
  modecubit() :super(modeinitial());



  static modecubit get(context) => BlocProvider.of(context);


  bool isDark=false;
  void mode(){
    debugPrint("mode");
    isDark = !isDark;
    emit(modeinitial());
  }
}