import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/dashboard_controller.dart';
import '../../controller/dashboard_state.dart';

class MyBottom extends StatelessWidget{
  const MyBottom({super.key, required this.controller});
  final DashBoardController controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<DashBoardController,DashBoardState>(
        builder: (context,state){
          final DashBoardController controller= context.read<DashBoardController>();
          return BottomNavigationBar(
            currentIndex: controller.selectedTapIndex,
            onTap: controller.onChangeTapIndex,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            unselectedLabelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.red,
            ),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.person),label:'Chats'),
              BottomNavigationBarItem(icon: Icon(Icons.amp_stories),label:'Stories'),
              BottomNavigationBarItem(icon: Icon(Icons.call),label:'Calls'),
              //BottomNavigationBarItem(icon: Icon(Icons.settings),label:'Settings'),
            ],
          );
        },
      ),
    );
  }

}