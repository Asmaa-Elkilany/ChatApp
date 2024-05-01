import 'package:auth/features/auth/welcome/view/page/welcome_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/components/onbarding_info.dart';
import '../view/components/onboarding_items.dart';
part 'onboarding_controller_state.dart';
class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit() : super(OnboardingControllerInitial());

  final pageController = PageController();
  final controller = OnboardingItems();

  List<OnboardingInfo> items = [
  OnboardingInfo(
  title: "Welcome",
  descriptions: "Have a great chatting experience by using this App,Make it easier, simpler, and faster to connect with everyone .",
  image: "images/assets/images/onboarding33.gif"),

  OnboardingInfo(
  title: "Message",
  descriptions: "Have an interactive chat, with Every feature you could imagine,Makes it easy to get work done where the conversation is happening.",
  image: "images/assets/images/onboarding11.gif"),

  OnboardingInfo(
  title: "Online",
  descriptions: "Interface is streamlined and familiar.Best app to work without Phone number",
  image: "images/assets/images/onboarding22.gif"),

  OnboardingInfo(
  title: "Inbox",
  descriptions: "Fully encrypted messaging built on an open source protocol.Ensure High level of Privacy",
  image: "images/assets/images/onboarding44.gif"),
];

  void onChangeToNext(BuildContext context) {
    if (pageController.page == controller.items.length - 1) {
      onCallSkip(context);
    } else {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.bounceIn,
      );
    }
  }
  Future<void> onCallSkip(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('onboarding', true);
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const WelcomePage(),
      ),
    );
  }
}


