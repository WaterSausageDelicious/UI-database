


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:uidb/src/constants/sizes.dart';
import 'package:uidb/src/constants/text_strings.dart';
import 'package:uidb/src/features/authentication/model/user_model.dart';
import 'package:uidb/src/features/authentication/screens/profile_screen/profile_screen.dart';

import '../../controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.to(() => const ProfileScreen())
        , icon: const Icon(LineAwesomeIcons.angle_left),),
        title: Text(bpdEditProfile, style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: SingleChildScrollView(
       child:Container(
         padding: const EdgeInsets.all(bpdDefaultSize),
         child: FutureBuilder(
           future: controller.getAllUser(),
           builder: (context, snapshot) {
             if(snapshot.connectionState == ConnectionState.done) {
               if(snapshot.hasData){
                 UserModel userData = snapshot.data as UserModel;
                 return ListView.builder(
                   shrinkWrap: true,
                   itemCount: snapshot.data!.length,
                   itemBuilder: (c, index) {
                      return Column(
                      children: [
                        ListTile(
                      iconColor: Colors.blue,
                      tileColor: Colors.blue.withOpacity(0.1),
                      leading: const Icon(LineAwesomeIcons.user_1),
                      title: Text("Name: ${snapshot.data![index].fullName}"),
                      subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data![index].phoneNo),
                        Text(snapshot.data![index].email),
                 ],
                 ),
                      ),
                        const SizedBox(height: 10,)
                      ],
                      );
                 }
                 );
               } else if (snapshot.hasError){
                 return Center (child: Text(snapshot.error.toString()),);
               } else {
                 return const Center (child: Text('something went wrong'),);
               }
             } else {
                 return const Center (child: CircularProgressIndicator());
             }

           },

         ),
       ),
    )
    );
  }
}
