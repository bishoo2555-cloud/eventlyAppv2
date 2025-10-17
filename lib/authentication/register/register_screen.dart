import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:eventlyapp/Home%20Screen/tabs/widgets/custom_elevated_button.dart';
import 'package:eventlyapp/Home%20Screen/tabs/widgets/custom_textformfiled.dart';
import 'package:eventlyapp/Providers/app_language_provider.dart';
import 'package:eventlyapp/firebase/firebase_utils.dart';
import 'package:eventlyapp/firebase/user_model.dart';
import 'package:eventlyapp/generated/l10n.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import '../../Providers/user_provider.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final formkey = GlobalKey<FormState>();

  bool isPasswordObscured = true;
  bool isRePasswordObscured = true;
  TextEditingController nameController = TextEditingController(text: "BISHOY");
  TextEditingController emailController =
      TextEditingController(text: "SAKATA@UNLUCKY.SAD");
  TextEditingController passwordController =
      TextEditingController(text: "HELP");
  TextEditingController rePasswordController =
      TextEditingController(text: "HEEEELP");

  int? _getCurrentLanguageValue(String language) {
    switch (language) {
      case "en":
        return 0;
      case "ar":
        return 1;
      default:
        return null;
    }
  }

  String _getLanguageFromValue(int? value) {
    switch (value) {
      case 0:
        return "en";
      case 1:
        return "ar";
      default:
        return "en";
    }
  }

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: AppColor.primaryLightColor),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          S.of(context).register,
          style: AppStyle.reglur22Primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: hieght * 0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppAssets.eventLogo),
              SizedBox(
                height: hieght * 0.03,
              ),
              Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextformfiled(
                      controller: nameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Your name";
                        }

                        return null;
                      },
                      hintText: S.of(context).name,
                      prefixIcon: Icon(EvaIcons.person),
                    ),
                    SizedBox(
                      height: hieght * 0.02,
                    ),
                    CustomTextformfiled(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Email";
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return "Please Enter Valid Email";
                        }
                        return null;
                      },
                      hintText: S.of(context).email,
                      prefixIcon: Icon(EvaIcons.email),
                    ),
                    SizedBox(
                      height: hieght * 0.02,
                    ),
                    CustomTextformfiled(
                      controller: passwordController,
                      isObscured: isPasswordObscured,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Password";
                        }
                        return null;
                      },
                      hintText: S.of(context).password,
                      prefixIcon: Icon(Clarity.lock_solid),
                      suffixIcon: InkWell(
                          onTap: () {
                            isPasswordObscured = !isPasswordObscured;
                            setState(() {});
                          },
                          child: isPasswordObscured
                              ? Icon(EvaIcons.eye_off)
                              : Icon(EvaIcons.eye)),
                    ),
                    SizedBox(
                      height: hieght * 0.02,
                    ),
                    CustomTextformfiled(
                      controller: rePasswordController,
                      isObscured: isRePasswordObscured,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Re-Password";
                        }
                        if (text != passwordController.text) {
                          return "Re-Password doesn't Match Password";
                        }
                        return null;
                      },
                      hintText: S.of(context).re_password,
                      prefixIcon: Icon(Clarity.lock_solid),
                      suffixIcon: InkWell(
                          onTap: () {
                            isRePasswordObscured = !isRePasswordObscured;
                            setState(() {});
                          },
                          child: isRePasswordObscured
                              ? Icon(EvaIcons.eye_off)
                              : Icon(EvaIcons.eye)),
                    ),
                    SizedBox(
                      height: hieght * 0.022,
                    ),
                    CustomElevatedButton(
                      onPressed: register,
                      text: S.of(context).create_account,
                    ),
                    SizedBox(
                      height: hieght * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).already_have_account,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "${S.of(context).login}",
                              style: AppStyle.Bold16PrimaryItalicUL,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: hieght * 0.02,
                    ),
                    Column(
                      children: [
                        AnimatedToggleSwitch<int?>.rolling(
                          iconOpacity: 100,
                          allowUnlistedValues: true,
                          styleAnimationType: AnimationType.onHover,
                          current: _getCurrentLanguageValue(
                              languageProvider.appLanguage),
                          values: const [0, 1],
                          onChanged: (i) {
                            final newLanguage = _getLanguageFromValue(i);
                            languageProvider.changeLanguage(newLanguage);
                          },
                          iconBuilder: languageIconBuilder,
                          style: ToggleStyle(
                              backgroundColor: Colors.transparent,
                              borderColor: AppColor.primaryLightColor,
                              borderRadius: BorderRadius.circular(25),
                              indicatorColor: AppColor.primaryLightColor),
                          borderWidth: 3.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formkey.currentState?.validate() == true) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        MyUser myUser = MyUser(
            id: credential.user?.uid ?? '',
            name: nameController.text,
            email: emailController.text);
        await FireBaseUtils.AddUserToFireStore(myUser);
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(myUser);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('account created successfully !'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Widget languageIconBuilder(int? value, bool foreground) {
    return Container(
      child: Center(
        child: flagByValue(value),
      ),
    );
  }

  Widget iconBuilder(int value) {
    return languageIconBuilder(value, false);
  }

  Widget rollingIconBuilder(int? value, bool foreground) {
    return Container(
      child: Center(
        child: flagByValue(value),
      ),
    );
  }

  Color colorBuilder(int value) => switch (value) {
        0 => Colors.blueAccent,
        1 => Colors.red,
        _ => AppColor.primaryLightColor,
      };

  Widget flagByValue(int? value) => switch (value) {
        0 => Flag(
            Flags.united_states_of_america,
            size: 28,
          ),
        1 => Flag(
            Flags.egypt,
            size: 28,
          ),
        _ => Icon(
            Icons.language,
            size: 28,
            color: AppColor.primaryLightColor,
          ),
      };
}
