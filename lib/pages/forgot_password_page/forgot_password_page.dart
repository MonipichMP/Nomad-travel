import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/default_button.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/pages/main_page/main_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: AppColor.grey,
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Text(
                  "Forgot Password?",
                  style: titleStyle.copyWith(color: AppColor.black),
                ),
                SizedBox(height: 10),
                Text(
                  "Enter your phone number below to receive \nyour password reset instruction",
                  style: normalStyle.copyWith(color: AppColor.black),
                ),
                SizedBox(height: 50),
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  style: normalStyle.copyWith(color: AppColor.black),
                  controller: phone,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone_iphone,
                      color: Colors.grey,
                    ),
                    fillColor: Colors.grey,
                    hintText: 'Phone Number',
                    hintStyle: normalStyle.copyWith(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Phone can\'t be empty';
                    }
                    if (input.length < 9) {
                      return "Input phone is incorret form";
                    }
                  },
                ),
                SizedBox(height: 50),
                DefaultButton(
                  height: 56,
                  color: Colors.grey,
                  title: "Reset Password",
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
