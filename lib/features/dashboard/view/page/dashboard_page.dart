import 'package:dashboard/cubit/dashboard_cubit.dart';
import 'package:dashboard/modules/chats/view/page/chats_page.dart';
import 'package:dashboard/modules/favorite/view/page/favorite_page.dart';
import 'package:dashboard/modules/settings/view/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


class DashboardPage extends StatelessWidget {
  final List<String> titles = const ['Chats', 'Favourites', 'Settings'];
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          DashboardCubit cubit = context.read<DashboardCubit>();
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'new_Chat');
                    },
                    icon: const Icon(CupertinoIcons.person_badge_plus))
              ],

              title: Text(
              titles [cubit.currentIndex],
          ),
            ),
            body: PageView(
              controller: cubit.pageController,
              onPageChanged: cubit.onChangeTab,
              children: const [
                ChatsPage(),
                FavoritePage(),
                SettingsPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: cubit.onChangeTab,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person), label: 'Chats'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.heart), label: 'Favourites'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.settings), label: 'Settings')
              ],
            ),

          );
        },
      ),
    );
  }
}
