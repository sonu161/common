import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidbi_app/app/login/controller/loging_ctrl.dart';
import 'package:sidbi_app/app/user/controller/user_controller.dart';
import 'package:sidbi_app/components/form_field.dart';

class UserEditView extends StatefulWidget {
  const UserEditView({super.key});

  @override
  State<UserEditView> createState() => _UserEditViewState();
}

class _UserEditViewState extends State<UserEditView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: GetX(
                      init: UserController(),
                      builder: (ctrl){
                        return Column(
                      children: [
                        Container(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Update detail form",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17
                                ),
                              )
                          ),
                        ),
                        SizedBox(height: 20),
                        FormFields(
                          fullLabel: true,
                          fullLabelText: "Employee Name",
                          hint: "Enter Name",
                          borderRadius: 6,
                          readOnly: true,
                          disabled: true,
                          textEditingController: ctrl.name.value,
                        ),
                        SizedBox(height: 10),
                        FormFields(
                          fullLabel: true,
                          fullLabelText: "Mobile Number",
                          hint: "Enter Number",
                          borderRadius: 6,
                          textEditingController: ctrl.number.value,
                        ),
                        SizedBox(height: 10),
                        FormFields(
                          isMail:true,
                          fullLabel: true,
                          fullLabelText: "Email Address",
                          hint: "Enter Email",
                          borderRadius: 6,
                          textEditingController: ctrl.email.value,),
                        SizedBox(height: 10),
                        FormFields(
                          fullLabel: true,
                          fullLabelText: "Pin Code",
                          hint: "Enter Code",
                          borderRadius: 6,
                          textEditingController: ctrl.pin_code.value,),
                        SizedBox(height: 10),
                        FormFields(
                          fullLabel: true,
                          fullLabelText: "First Address",
                          hint: "Enter address",
                          borderRadius: 6,
                          textEditingController: ctrl.first_address.value,),
                        SizedBox(height: 10),
                        FormFields(
                            fullLabel: true,
                            fullLabelText: "Second Address",
                            hint: "Enter address",
                            textEditingController: ctrl.second_address.value,
                            borderRadius: 6),
                        SizedBox(height: 10),
                        FormFields(
                            fullLabel: true,
                            fullLabelText: "Last Address",
                            hint: "Enter address",
                            textEditingController: ctrl.last_address.value,
                            borderRadius: 6)
                      ],
                    );
                      },
                    ),
                  ),
                ),
        ],
      ),

      bottomNavigationBar: GetX(
        init: UserController(),
        builder: (ctrl){
          if(ctrl.refreshingState.value == RefreshState.Loading){
            return Container();
          }else{
            return Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 15, 15, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Material(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(300),
                        child: InkWell(
                          onTap: () {
                            ctrl.updateData();
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Update Details",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white.withOpacity(0.5),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
