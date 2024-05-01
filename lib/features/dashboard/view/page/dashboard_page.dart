
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/dashboard_controller.dart';
import '../../controller/dashboard_state.dart';
import '../components/bottom.dart';
import '../components/my_design.dart';

class DashboardPage extends StatelessWidget{
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: DashBoardController(),
      child: BlocBuilder<DashBoardController,DashBoardState>(
        builder: (context,state){
          final DashBoardController controller= context.read<DashBoardController>();
          return Scaffold(
            backgroundColor: Colors.green,
            appBar: AppBar(
              backgroundColor: Colors.yellow,
              title: const Text("My Design"),
            ),
            body:  MyDesign(controller: controller,),
            bottomNavigationBar: MyBottom(controller: controller,),
          );
        },
      ),
    );
    /*
    */
  }

}