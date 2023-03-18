
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:uidb/src/constants/text_strings.dart';
import 'package:uidb/src/features/authentication/screens/profile_screen/profile_screen.dart';
import 'package:uidb/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:uidb/src/features/repository/authentication_repository/authentication_repository.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.to (() => WelcomeScreen());
        } , icon: const Icon(LineAwesomeIcons.angle_left) ),
        title: Text('I am garbage', style: Theme
            .of(context)
            .textTheme
            .headlineSmall),
        centerTitle: true,
        elevation: 0,
        actions: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal:20, vertical: 7),
              child: ElevatedButton(onPressed: () {
                Get.to (() => const ProfileScreen());
              },
                  child: const Text ('Click here to edit profile'))
          )
        ],
      ),
    );
  }
}




