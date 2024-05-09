import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:we_courier_delivery_app/Screen/Authentication/sign_in.dart';

import '../../Controllers/auth-controller.dart';
import '../../utils/image.dart';
import '../../utils/size_config.dart';
import '../Widgets/button_global.dart';
import '../Widgets/constant.dart';
import '../Widgets/loader.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = true;
  final _formKey = GlobalKey<FormState>();
  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    SizeConfigCustom sizeConfig = SizeConfigCustom();
    sizeConfig.init(context);
    return Scaffold(
      backgroundColor: kMainColor,
      body: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (auth) =>
              Stack(children: [
                Center(
                    child:
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 0),
                            height: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Images.appLogo),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          Text(
                            'registration_form'.tr,
                            style: kTextStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            'please_enter_your_user_information'.tr,
                            style: kTextStyle.copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child:
                              Form(
                                  key: _formKey,
                                  child:
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 10.0),
                                      AppTextField(
                                        showCursor: true,
                                        controller: auth.firstNameController,
                                        validator: (value) {
                                          if (auth.firstNameController.text.isEmpty) {
                                            return "this_field_can_t_be_empty".tr;
                                          }
                                          return null;
                                        },
                                        cursorColor: kTitleColor,
                                        textFieldType: TextFieldType.NAME,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'first_name'.tr,
                                          labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                          hintText: 'we'.tr,
                                          hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      AppTextField(
                                        showCursor: true,
                                        controller: auth.lastNameController,
                                        validator: (value) {
                                          if (auth.lastNameController.text.isEmpty) {
                                            return "this_field_can_t_be_empty".tr;
                                          }
                                          return null;
                                        },
                                        cursorColor: kTitleColor,
                                        textFieldType: TextFieldType.NAME,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'last_name'.tr,
                                          labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                          hintText: 'courier'.tr,
                                          hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      TextFormField(
                                        cursorColor: kTitleColor,
                                        controller: auth.addressController,
                                        validator: (value) {
                                          if (auth.addressController.text.isEmpty) {
                                            return "this_field_can_t_be_empty".tr;
                                          }
                                          return null;
                                        },
                                        textAlign: TextAlign.start,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'address'.tr,
                                          labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                          contentPadding: const EdgeInsets.symmetric(
                                              vertical: 30, horizontal: 10.0),
                                        ),
                                      ),
                                      const SizedBox(height: 10),

                                      AppTextField(
                                        showCursor: true,
                                        controller: auth.emailController,
                                        validator: (value) {
                                          if (auth.emailController.text.isEmpty) {
                                            return "this_field_can_t_be_empty".tr;
                                          }
                                          return null;
                                        },
                                        cursorColor: kTitleColor,
                                        textFieldType: TextFieldType.EMAIL,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'emails'.tr,
                                          labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                          hintText: 'example@gmail.com',
                                          hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                                          suffixIcon:
                                          const Icon(Icons.mail, color: kGreyTextColor),
                                        ),
                                      ),

                                      const SizedBox(height: 10),
                                      AppTextField(
                                        showCursor: true,
                                        cursorColor: kTitleColor,
                                        controller: auth.phoneController,
                                        validator: (value) {
                                          if (auth.phoneController.text.isEmpty) {
                                            return "this_field_can_t_be_empty".tr;
                                          }
                                          return null;
                                        },
                                        textFieldType: TextFieldType.PHONE,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'mobile'.tr,
                                          labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                          hintText: '017XXXXXXXX',
                                          hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      AppTextField(
                                        showCursor: true,
                                        cursorColor: kTitleColor,
                                        controller: auth.passwordController,
                                        validator: (value) {
                                          if (auth.passwordController.text.isEmpty) {
                                            return "this_field_can_t_be_empty".tr;
                                          }
                                          return null;
                                        },
                                        textFieldType: TextFieldType.PASSWORD,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'password'.tr,
                                          labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                          hintText: '********',
                                          hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                            activeColor: kMainColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(2.0),
                                            ),
                                            value: isChecked,
                                            onChanged: (val) {
                                              setState(
                                                    () {
                                                  isChecked = val!;
                                                },
                                              );
                                            },
                                          ),
                                          Flexible(
                                            child: RichText(
                                              text: TextSpan(
                                                  text: 'i_agree_to'.tr,
                                                  style: kTextStyle.copyWith(color: kTitleColor),
                                                  children: [
                                                    TextSpan(
                                                      text: 'e_courier'.tr,
                                                      style: kTextStyle.copyWith(
                                                          color: kGreyTextColor),
                                                    ),
                                                    TextSpan(
                                                      text: 'privacy_Policy_&_terms'.tr,
                                                      style:
                                                      kTextStyle.copyWith(color: kTitleColor),
                                                    )
                                                  ]),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10.0),

                                      SizedBox(
                                          height: 70,
                                          child: ButtonGlobal(
                                              buttontext: 'register_my_account'.tr,
                                              buttonDecoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30.0),
                                                  color: kMainColor),
                                              onPressed: () async {
                                                if (_formKey.currentState!.validate()) {
                                                  await auth.signupOnTap();
                                                }
                                              })),
                                      Flexible(child:
                                      RichText(
                                        text: TextSpan(
                                          text: 'already_member'.tr,
                                          style: kTextStyle.copyWith(color: kGreyTextColor),
                                          children: [
                                            TextSpan(
                                              text: 'login_here'.tr,
                                              style: kTextStyle.copyWith(color: kMainColor),
                                            ),
                                          ],
                                        ),
                                      ).onTap(() => const SignIn().launch(context),
                                      )),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )),
                auth.loader
                    ? Positioned(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white60,
                      child: const Center(child: LoaderCircle())),
                )
                    : const SizedBox.shrink(),
              ])
      ),
    );
  }
}
