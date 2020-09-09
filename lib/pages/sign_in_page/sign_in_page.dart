import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/default_button.dart';
import 'package:nomad_travel/common_widgets/orange_backpack.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/pages/forgot_password_page/forgot_password_page.dart';

class SignInPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

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
                SizedBox(height: 40),
                OrangeBackpack(),
                SizedBox(height: 20),
                Text(
                  "Welcome back",
                  style: titleStyle.copyWith(color: AppColor.black),
                ),
                SizedBox(height: 10),
                Text(
                  "Sign in to continue",
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
                SizedBox(height: 30),
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  style: normalStyle.copyWith(color: AppColor.black),
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
                    fillColor: Colors.grey,
                    hintText: 'Password',
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
                  keyboardType: TextInputType.text,
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'password can\'t be empty';
                    }
                    if (input.length < 6) {
                      return 'Input password more than 6';
                    }
                  },
                ),
                SizedBox(height: 50),
                DefaultButton(
                  height: 56,
                  color: AppColor.blue,
                  title: "Sign in",
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 30),
                DefaultButton(
                  height: 56,
                  color: AppColor.black,
                  title: "Sign in with Apple",
                  onPressed: () {},
                ),
                SizedBox(height: 20),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot Password",
                      style: normalStyle.copyWith(color: AppColor.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
