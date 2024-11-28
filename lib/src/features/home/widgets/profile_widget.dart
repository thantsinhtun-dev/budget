import 'package:budget/src/core/app_fonts.dart';
import 'package:budget/src/extensions/ext_date.dart';
import 'package:budget/src/routes/app_route_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import '../../../core/dimens.dart';
import '../provider/profile_controller.dart';
import '../provider/profile_state.dart';

class ProfileWidget extends ConsumerWidget {
  const ProfileWidget({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var profile = ref.watch(profileControllerProvider);
    return switch (profile) {
      ProfileInitialState() => const CircularProgressIndicator(),
      ProfileSuccessState() => Row(
        children: [
          CircleAvatar(
              radius: 24,
              backgroundImage: CachedNetworkImageProvider(profile.entity.image)),
          const SizedBox(width: kMarginMedium),
          TouchableOpacity(
            onLongPress: (){
              var profileRef = ref.read(profileControllerProvider.notifier);
              profileRef.logout((){
                OnBoardRoute().pushReplacement(context);
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.getMorningText(),
                  style: context.appFonts.body3(),
                ),
                Text(
                  profile.entity.name,
                  style: context.appFonts.body2(),
                ),
              ],
            ),
          )
        ],
      ),
    };
  }
}

