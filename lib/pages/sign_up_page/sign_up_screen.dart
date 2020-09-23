import 'package:flutter/material.dart';
import 'package:nomad_travel/common_widgets/circle_image.dart';
import 'package:nomad_travel/common_widgets/default_button.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/pages/sign_in_page/sign_in_page.dart';

class SignUpPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Create an Account",
          style: titleStyle.copyWith(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(flex: 1),
                CircleImage(
                  width: 100,
                  height: 100,
                  image: NetworkImage(
                      "https://i.pinimg.com/564x/f4/1f/e3/f41fe384dd173f91201f622e11be8a31.jpg"),
                ),
                SizedBox(height: 40),
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
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: Colors.grey,
                    ),
                    fillColor: Colors.grey,
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
                    hintText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Email can\'t be empty';
                    }
                    if (!input.contains('@')) {
                      return 'Input email wrong pattern';
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
                  title: "Sign up",
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No account yet? ", style: subtitleStyle.copyWith(color: Colors.grey),),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Login here",
                        style: normalStyle,
                      ),
                    )
                  ],
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
