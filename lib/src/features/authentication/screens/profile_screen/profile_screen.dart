import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:uidb/src/constants/image_strings.dart';
import 'package:uidb/src/constants/sizes.dart';
import 'package:uidb/src/constants/text_strings.dart';
import 'package:uidb/src/features/authentication/screens/profile_screen/update_profile.dart';
import 'package:uidb/src/features/repository/Dashboard/dashboard.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.to(() => const Dashboard());
              },
              icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text(bpdProfile,
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            IconButton(
                onPressed: () {},
                icon:
                    Icon(isDark ? LineAwesomeIcons.moon : LineAwesomeIcons.sun))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(bpdDefaultSize),
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: AssetImage(bpdWelcomeImage),
                      )),
                ),
                const SizedBox(height: 10),
                Text(
                  bpdProfileHeading,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  bpdProfileSubHeading,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => Get.to (() => const UpdateProfileScreen()),
                    child: const Text(bpdEditProfile),

                  ),
                )
              ],
            ),
          ),
        ));
  }
}
