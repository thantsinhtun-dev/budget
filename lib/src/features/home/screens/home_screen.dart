import 'package:budget/src/core/app_colors.dart';
import 'package:budget/src/features/home/provider/transition_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/dimens.dart';
import '../provider/home_controller.dart';
import '../provider/profile_controller.dart';
import '../widgets/cashflow_widget.dart';
import '../widgets/history_widget.dart';
import '../widgets/profile_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});


  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    var homeController = ref.read(homeControllerProvider.notifier);
    homeController.getCashFlow();
    var profile = ref.read(profileControllerProvider.notifier);
    profile.getProfile();
    var transitions = ref.read(transitionControllerProvider.notifier);
    transitions.getTransitions();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.colorPrimary,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kMarginMedium_2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileWidget(),
              SizedBox(height: kMarginMedium_2),
              CashFlowWidget(),
              SizedBox(height: kMarginMedium_2),
              Expanded(child: HistoryWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
