


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:uidb/src/constants/image_strings.dart';
import 'package:uidb/src/constants/sizes.dart';
import 'package:uidb/src/constants/text_strings.dart';
import 'package:uidb/src/features/authentication/screens/profile_screen/profile_screen.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.to(() => ProfileScreen())
        , icon: const Icon(LineAwesomeIcons.angle_left),),
        title: Text(bpdEditProfile, style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: SingleChildScrollView(
       child:Container(
         padding: const EdgeInsets.all(bpdDefaultSize),
         child: Column(
           children: [
             Stack(
               children: [
                 SizedBox(
                   width: 120,
                   height: 120,
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(100), child: const Image(image:AssetImage(bpdWelcomeImage)),
                   ),
                 )
               ],
             ),
             const SizedBox(height: 50),
             Form(child:
             Column(
               children: [
                 TextFormField(
                   decoration: const InputDecoration(label: Text(bpdFullName), prefixIcon: Icon(Icons.person)),
                   ),
                 const SizedBox(height: bpdFormHeight - 20),
                  TextFormField(
                    decoration:const InputDecoration(label: Text(bpdEmail), prefixIcon: Icon(Icons.email)),
                  ),
                 const SizedBox(height: bpdFormHeight - 20),
                 IntlPhoneField(
                     decoration: const InputDecoration(label: Text('Phone Number')),
                 ),
                     const SizedBox(height: bpdFormHeight - 20),
                   TextFormField(
                     decoration:const InputDecoration(label: Text(bpdPassword), prefixIcon: Icon(Icons.password)),
                   ),
                 const SizedBox(height: bpdFormHeight),
                 SizedBox(
                     width: 200,
                     child: ElevatedButton(
                       onPressed: () => Get.to (() => const UpdateProfileScreen()),
                       child: const Text(bpdEditProfile),
                     )
                 )
               ],
             )
             ),
           ],
         ),
       ),
    )
    );
  }
}
