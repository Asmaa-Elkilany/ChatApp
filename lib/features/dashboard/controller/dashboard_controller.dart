import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'dashboard_state.dart';


class DashBoardController extends Cubit<DashBoardState>{
  DashBoardController():super(DashBoardInitializationState());
  int selectedTapIndex =0;
  final PageController pageController = PageController();
  void onChangeTapIndex (int index){
    selectedTapIndex=index;
    pageController.jumpToPage(selectedTapIndex);
    emit(DashBoardChaneState());
  }
  Color backGroundColor=const Color(0xffffa000);
  void changeBackground(){
    if(backGroundColor==Colors.green) {
      backGroundColor=Colors.blue;
    }
    else{
      backGroundColor=Colors.green;
    }
    emit(DashBoardChangeBackgroundState());
  }
}