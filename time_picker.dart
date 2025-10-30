import 'package:flutter/material.dart';
import 'package:sidbi_app/components/presets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class TimeInput extends StatefulWidget {
  const TimeInput(
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
      this.dateRangePickerController,
      this.internationalTime,
      this.initialTime,
      this.timeValid});
  final String hint;
  final DateRangePickerController? dateRangePickerController;
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
  final bool? validator;
  final String? validatorText;
  final bool? internationalTime;
  final TimeOfDay? initialTime;
  final bool? timeValid;
  @override
  State<TimeInput> createState() => _DateInputState();
}

class _DateInputState extends State<TimeInput> {
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
              border: Border.all(color: Color(0xffF3F3F3), width: 1),
              color: widget.readOnly == true
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
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(300)),
                          boxShadow: [
                            BoxShadow(
                                color: const Color.fromARGB(25, 0, 0, 0),
                                blurRadius: 4)
                          ]),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: widget.fieldIcon,
                      ),
                    ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Focus(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      } else if (widget.timeValid == false) {
                        return "Past time is not allowed";
                      }
                      return null;
                    },
                    onTap: () async {
                      print(TimeOfDay.now());
                      var selectedTime = await showTimePicker(
                        initialTime: widget.initialTime ?? TimeOfDay.now(),
                        context: context,
                        confirmText: "Done",
                      );
                      if (widget.internationalTime == true) {
                        var time =
                            // "${selectedTime!.hour.toString().padLeft(2, '0')}:${
                            //   selectedTime.minute == 0?"00":
                            //   selectedTime.minute > 0 && selectedTime.minute < 10 ?"0${selectedTime.minute}":
                            //   selectedTime.minute}";
                            "${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2,'0')}";
                        TimeOfDay td = selectedTime;
                        print(selectedTime.format(context));
                        print(selectedTime.minute == 0?"00":selectedTime.minute);
                        widget.textEditingController!.text = time;
                      } else {
                        var hr = selectedTime!.hour > 12
                            ? selectedTime.hour - 12
                            : selectedTime.hour;
                        String timeLine = selectedTime.hour > 12 ? "PM" : "AM";
                        var time = "$hr:${selectedTime.minute} $timeLine";
                        widget.textEditingController!.text =time.toString();
                      }
                    },
                    readOnly: widget.readOnly ?? false,
                    obscureText: widget.obsecureText ?? false,
                    decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(
                        //   top: -15,
                        //   bottom: 0
                        // ),
                        // suffix: widget.obsecureText == null ?null:IconButton(
                        //   icon: Icon(Icons.remove_red_eye),
                        //   onPressed: (){},
                        // ),
                        border: InputBorder.none,
                        hintText: widget.hint,
                        hintStyle: TextStyle(fontSize: 15)),
                    controller: widget.textEditingController,
                    textAlign: widget.textAlign == null
                        ? TextAlign.left
                        : widget.textAlign!,
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
                        color: Presets.lightColorIcon,
                      ),
                      onPressed: widget.obsecureToNoSecure,
                    )
            ],
          ),
        ),
        Container(
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
      ],
    );
  }
}
