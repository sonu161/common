import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sidbi_app/app/forget_password/controller/forgot_pass_controller.dart';
import 'package:sidbi_app/app/login/controller/loging_ctrl.dart';
import 'package:sidbi_app/components/form_field.dart';
import 'package:sidbi_app/components/load_d.dart';
import 'package:sidbi_app/components/main_button.dart';


class ForgetPpaswordView extends StatefulWidget {
  const ForgetPpaswordView({super.key});

  @override
  State<ForgetPpaswordView> createState() => _ForgetPpaswordViewState();
}

class _ForgetPpaswordViewState extends State<ForgetPpaswordView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            children: [
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "Reset \n"
                              "Password"
                          .tr,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                    "Enter your userid and email address associated with your account for setting up new password",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.8),
                  fontSize: 15
                ),),
              ),
              SizedBox(
                height: 30,
              ),
              GetX(
                init: ForgotPassController(),
                builder: (ctrl){
                  return Form(
                    key: ctrl.formKey.value,
                    child: Column(
                      children: [
                        Container(
                          child: FormFields(
                            textEditingController: ctrl.userid.value,
                            hint: 'Enter userid',
                            fullLabel: true,
                            fullLabelText: "User Id",
                            borderRadius: 10,
                            lightTextBox: true,
                            // validator: ctrl.useridCheck.value,
                            validatorText: "Userid is required",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: FormFields(
                            textEditingController: ctrl.emailAdd.value,
                            hint: 'Enter email',
                            fullLabel: true,
                            fullLabelText: "Email address",
                            borderRadius: 10,
                            lightTextBox: true,
                            showCustomMsg: false,
                            
                            // validator: (val){ 
                            //   if(val!.contains("@")){
                            //     return "Enter valid mail id";
                            //   }else{
                            //     return null;
                            //   }
                            // },
                            isMail: true,
                            validatorText: "Email address is required",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ctrl.appLoadingState == AppLoadingState.Loading?Container(
                          child: Center(
                            child: LoadD(),
                          ),
                        ): Row(
                          children: [
                            Expanded(
                              flex: 2,
                          child: FormFields(
                            textEditingController: ctrl.captcha.value,
                            hint: 'Enter Captcha',
                            // fullLabel: false,
                            // fullLabelText: "Ca",
                            borderRadius: 10,
                            lightTextBox: true,
                            // validator: ctrl.emailCheck.value,
                            validatorText: "Captcha is required",
                            fieldIcon: Image(image: MemoryImage(
                                        base64Decode(ctrl.captchaImage.value))),
                                        bigFieldImage: true,
                            trailingBtn: Icon(Icons.refresh),
                            onTapTrailing: (){
                              ctrl.refreshCaptcha();
                            },
                            showLoading: ctrl.loadingCtrl == RefreshState.Loading?true:false,
                          ),
                        ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MainButton(
                          buttonLable: "Proceed",
                          onTap: () {
                            ctrl.checkFields();
                          },
                          borderRadius: 10,
                          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
