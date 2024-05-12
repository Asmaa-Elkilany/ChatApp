
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../cubit/dashboard_cubit.dart';
import '../../modules/chats/view/page/chats_page.dart';
import '../../modules/favorite/view/page/favorite_page.dart';
import '../../modules/settings/view/settings.dart';
import '../../modules/settings/view/themenotifier.dart';

class DashboardPage extends StatelessWidget {
  final List<String> titles = const ['Chats', 'Favourites', 'Settings'];
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
   // final themeNotifier = Provider.of<ThemeNotifier>(context);
  //  theme: themeNotifier.getTheme,

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
                    icon: const Icon(CupertinoIcons.person_badge_plus, color: Colors.white))
              ],
              backgroundColor: Theme.of(context).primaryColor,
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
              selectedItemColor: Theme.of(context).primaryColor.withOpacity(.8),
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
