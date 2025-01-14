import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uidb/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(bpdDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bpdForgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            Text(bpdForgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 30.0),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: bpdEmail,
              subTitle: bpdResetViaEmail,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => ForgetPasswordMailScreen());
                },
            ),
            const SizedBox(height: 20.0),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: bpdPhone,
              subTitle: bpdResetViaPhone,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
