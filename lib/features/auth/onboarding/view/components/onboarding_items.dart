import 'package:project_flutter/core/resources/assets_values_managers.dart';

import 'onbarding_info.dart';

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Welcome",
        descriptions:
            "Have a great chatting experience by using this App,Make it easier, simpler, and faster to connect with everyone .",
        image: AssetsValuesManger.onboarding1Image),
    OnboardingInfo(
        title: "Message",
        descriptions:
            "Have an interactive chat, with Every feature you could imagine,Makes it easy to get work done where the conversation is happening.",
        image: AssetsValuesManger.onboarding2Image),
    OnboardingInfo(
        title: "Online",
        descriptions:
            "Interface is streamlined and familiar.Best app to work without Phone number",
        image: AssetsValuesManger.onboarding3Image),
    OnboardingInfo(
        title: "Inbox",
        descriptions:
            "Fully encrypted messaging built on an open source protocol.Ensure High level of Privacy",
        image: AssetsValuesManger.onboarding4Image),
  ];
}
