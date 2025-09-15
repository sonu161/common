import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sidbi_app/components/comp_controllers/input_controller.dart';
import 'package:sidbi_app/components/presets.dart';

class FormFields extends StatefulWidget {
  const FormFields(
      {super.key,
      this.borderRadius,
      this.fullLabel,
      this.fullLabelText,
      this.lightTextBox,
      this.readOnly,
      required this.hint,
      this.textEditingController,
      this.obsecureText,
      this.fieldIcon,
      this.obsecureToNoSecure,
      this.textAlign,
      this.fieldError,
      this.validator,
      this.validatorText,
      this.onTap,
      this.disabled,
      this.onchange,
      this.textInputType,
      this.textInputFormatter,
      this.showCustumValidator,
      this.bigFieldImage,
      this.onTapTrailing,
      this.showLoading,
      this.trailingBtn,
      this.showCustomMsg,
      this.isMail,this.decimalReq,
      this.maxLength,
      this.isPass});

  final String hint;
  final TextEditingController? textEditingController;
  final bool? obsecureText;
  final Image? fieldIcon;
  final Function()? obsecureToNoSecure;
  final TextAlign? textAlign;
  final bool? fieldError;
  final double? borderRadius;
  final bool? fullLabel;
  final String? fullLabelText;
  final bool? lightTextBox;
  final bool? readOnly;
  final String? validatorText;
  final Function()? onTap;
  final bool? disabled;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final TextInputFormatter? textInputFormatter;
  final void Function(String)? onchange;
  final bool? showCustumValidator;
  final bool? bigFieldImage;
  final Icon? trailingBtn;
  final Function()? onTapTrailing;
  final bool? showLoading;
  final bool? showCustomMsg;
  final bool? isMail;
  final bool? decimalReq;
  final int? maxLength;
  final bool? isPass; 

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.fullLabel == null
            ? Container()
            : Container(
                margin: EdgeInsets.only(left: 5, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("${widget.fullLabelText}"),
                ),
              ),
        Container(
          padding: const EdgeInsets.only(right: 10, left: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.surface, width: 1),
              color: widget.disabled == null
                  ? Theme.of(context).colorScheme.onPrimary
                  : widget.disabled == true
                      ? Color(0xffECEFF1)
                      : widget.readOnly == true
                          ? Color(0xffFAFAFA)
                          : widget.lightTextBox == null
                              ? Color(0xffFAFAFA)
                              : widget.lightTextBox == true
                                  ? Color(0xffffffff)
                                  : Color(0xffFAFAFA),
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 300))),
          child: Row(
            children: [
              widget.fieldIcon == null
                  ? Container()
                  : widget.bigFieldImage == null
                      ? Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(300)),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color.fromARGB(25, 0, 0, 0),
                                    blurRadius: 4)
                              ]),
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(300),
                              child: widget.fieldIcon,
                            ),
                          ),
                        )
                      : Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(300),
                              child: widget.fieldIcon,
                            ),
                        ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Focus(
                  child: TextFormField(
                    maxLength: widget.maxLength,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: widget.textEditingController,
                    onChanged: widget.onchange,
                    onTap: widget.onTap,
                    readOnly: widget.readOnly ?? false,
                    obscureText: widget.obsecureText ?? false,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintText: widget.hint,
                      hintStyle: Theme.of(context).textTheme.labelLarge,
                      
                    ),
                    keyboardType: widget.textInputType,
                    inputFormatters: <TextInputFormatter>[
                      widget.textInputFormatter ??
                          FilteringTextInputFormatter.singleLineFormatter
                    ],
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    validator: widget.validator ??
                        (value) {
                          if(widget.obsecureText == false || widget.obsecureText == null && widget.isMail == null || widget.isMail == false){
                            RegExp specialReg = RegExp(r'[!@#$%^&*(),?":{}|<>]');
                            if((specialReg.hasMatch(value!) || value.contains("<script>")) && widget.isPass != true){
                                var ctrl = Get.find<InputController>(); 
                                ctrl.clearInput(widget.textEditingController!);
                                // setState(() {
                                  // widget.textEditingController!.text = "";
                                // });
                              // });
                              return "Characters are not allowed";
                            }
                            if(widget.decimalReq == false){
                              if(value.contains(".") ){
                                return "Characters are not allowed";
                              }else{
                                return null;
                              }
                            }else{
                              return null;
                            }
                          }
                          else if (widget.isMail == true) {
                            RegExp emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&@'*+-/=?^_`{|}~]+[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if (value == "") {
                              return "This field is required";
                            } else if (!emailValid.hasMatch(value!) && value.length <= 50) {
                              return "Enter valid mail id";
                            } else {
                              return null;
                            }
                          } else {
                            if (value!.isEmpty) {
                              return "This field is required";
                            }
                            return null;
                          }

                          if(widget.textInputType == TextInputType.number){
                            if(value!.isNum == false){
                              return "Only numbers are allowed";
                            }
                            if(value.contains("-")){
                              return "Only positive numbers are allowed";
                            }else{
                              return null;
                            }
                          }
                        },
                  ),
                ),
              ),
              widget.obsecureText == null
                  ? Container(width: 0, height: 0)
                  : IconButton(
                      icon: Icon(
                        widget.obsecureText == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: widget.obsecureText == true
                            ? Theme.of(context).colorScheme.onSecondary
                            : Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: widget.obsecureToNoSecure,
                    ),
              widget.trailingBtn == null || widget.showLoading == true
                  ? Container()
                  : Container(
                      // child: Icon(Icons.refresh),
                      child: InkWell(
                        onTap: widget.onTapTrailing,
                        child: widget.trailingBtn,
                      ),
                    ),
              widget.showLoading == true
                  ? Container(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
        widget.showCustomMsg == null || widget.showCustomMsg == true
            ? Container(
                margin: EdgeInsets.only(top: 5),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: widget.validator == false || widget.validator == null
                        ? Container()
                        : Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.fromLTRB(5, 0, 20, 0),
                            decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.warning,
                                  color: Colors.red,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${widget.validatorText}",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          )),
              )
            : Container()
      ],
    );
  }
}
