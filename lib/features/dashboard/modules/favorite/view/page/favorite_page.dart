import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../contoller/favourite_cubit.dart';
import '../components/favorite_item_widget.dart';
import 'package:dashboard/modules/chats/contoller/chats_cubit.dart';
class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          final FavoriteCubit controller = context.read<FavoriteCubit>();
          return Scaffold(
            body: state is FavoriteStateLoading? const CircularProgressIndicator():
                state is FavoriteStateEmpty ?  const Center(child: Icon(CupertinoIcons.delete, size: 100,)):
            ListView.builder(
              itemBuilder:(_, int index) => FavoriteItemWidget(
                  usersModel:controller.users[index],
              controller: controller,
              ),
              itemCount: controller.users.length,
            ),
          );
        },
      ),
    );
  }
}


