import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nomad_travel/common_widgets/default_button.dart';
import 'package:nomad_travel/common_widgets/orange_backpack.dart';
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  style: titleStyle,
                ),
                SizedBox(height: 10),
                Text(
                  "Sign in to continue",
                  style: normalStyle,
                ),
                SizedBox(height: 50),
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  style: normalStyle,
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
                  style: normalStyle,
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 38.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Theme.of(context).cardColor,
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/apple-logo.svg",
                            color: Colors.white,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Sign in with Apple",
                            style: titleStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
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
                      style: normalStyle,
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
