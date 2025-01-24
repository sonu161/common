import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidbi_app/app/holiday_vof/controller/holiday_vof_controller.dart';
import 'package:sidbi_app/app/holiday_vof/view/add_vof.dart';
import 'package:sidbi_app/app/login/controller/loging_ctrl.dart';
import 'package:sidbi_app/components/loading.dart';
import 'package:sidbi_app/components/main_button.dart';
import 'package:sidbi_app/components/no_data.dart';
import 'package:sidbi_app/components/seperator.dart';

class HolidayVofView extends StatelessWidget {
  const HolidayVofView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HolidayVofViewLoader();
  }
}

class HolidayVofViewLoader extends StatefulWidget {
  const HolidayVofViewLoader({super.key});

  @override
  State<HolidayVofViewLoader> createState() => _HolidayVofViewLoaderState();
}

class _HolidayVofViewLoaderState extends State<HolidayVofViewLoader> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("HH/VOF"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(AddVof());
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 10),
            child: GetX(
              init: HolidayVofController(),
              builder: (ctrl) {
                if (ctrl.loading.value == AppLoadingState.Loading) {
                  return LoadingApp();
                } else if (ctrl.loading.value == AppLoadingState.Loaded) {
                  if (ctrl.adminHolidayHomeData.value.hhVofHisList != null ||
                      ctrl.dataPush.value.vofHHBookingList != null) {
                    if (ctrl.dataPush.value.vofHHBookingList != null) {
                      if (ctrl.dataPush.value.vofHHBookingList!.length > 0) {
                        if (ctrl.dataPush.value.vofHHBookingList != null) {
                          var data = ctrl.dataPush.value;
                          return ListView.builder(
                            reverse: false,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.vofHHBookingList!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                    EdgeInsets.only(left: 0, right: 0, bottom: 10),
                                padding: EdgeInsets.fromLTRB(15, 0, 15, data.vofHHBookingList![index]
                                                          .status ==
                                                      "1"?10:0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border(
                                    left: BorderSide(
                                      color: data.vofHHBookingList![index]
                                                                  .status ==
                                                              "1"?Color.fromARGB(255, 180, 202, 219):Colors.redAccent,
                                      width: 10
                                    )
                                  )
                                  // borderRadius: BorderRadius.circular(10),
                                  // boxShadow: [
                                  //   BoxShadow(color: const Color.fromARGB(31, 161, 161, 161), blurRadius: 10)
                                  // ]
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "${data.vofHHBookingList![index].bookingPlace}",
                                                    style: TextStyle(
                                                      color: Theme.of(context).colorScheme.onSecondary,
                                                        fontWeight: FontWeight.w800,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Submitted By User",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                              )
                                            ],
                                          ),
                                          Container(
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "${data.vofHHBookingList![index].applType}",
                                                style: TextStyle(
                                                    color: Theme.of(context).colorScheme.onSecondary,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // color: Colors.amber,
                                            child: Column(
                                              children: [
                                                data.vofHHBookingList![index]
                                                          .status ==
                                                      "1"?Container():Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "CANCELLED",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Theme.of(context).colorScheme.error
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                      "${data.vofHHBookingList![index].startDate}",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w700,
                                                                          color: Theme.of(
                                                                                  context)
                                                                              .colorScheme
                                                                              .onSecondary,
                                                                          fontSize:
                                                                              20)),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .call_received,
                                                                    color: Colors
                                                                        .green,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: MySeparator(
                                                          color: Theme.of(context).colorScheme.outline,
                                                          height: 1,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Icon(
                                                                    Icons.call_made,
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        175,
                                                                        76,
                                                                        81),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                      "${data.vofHHBookingList![index].endDate}",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w700,
                                                                          color: Theme.of(
                                                                                  context)
                                                                              .colorScheme
                                                                              .onSecondary,
                                                                          fontSize:
                                                                              20)),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                          "${data.vofHHBookingList![index].startTime}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                              color: Theme.of(context).colorScheme.onSecondary,
                                                              fontSize: 17)),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                          "${data.vofHHBookingList![index].endTime}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                              color: Theme.of(context).colorScheme.onSecondary,
                                                              fontSize: 17)),
                                                    )
                                                  ],
                                                ),
                                                // SizedBox(
                                                //   height: 20,
                                                // ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: RichText(
                                                        text: TextSpan(
                                                          text: "Remarks: ",
                                                          style: TextStyle(
                                                                color: Theme.of(context).colorScheme.onSecondary
                                                              ),
                                                          children: [
                                                            TextSpan(
                                                              text: "${data.vofHHBookingList![index].remark}",
                                                              style: TextStyle(
                                                                color: Theme.of(context).colorScheme.onSecondary
                                                              )
                                                            )
                                                          ]
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          // Container(
                                          //   child: Material(
                                          //     borderRadius:
                                          //         BorderRadius.circular(10),
                                          //     child: InkWell(
                                          //       borderRadius:
                                          //           BorderRadius.circular(10),
                                          //       onTap: () {
                                          //         if (data.vofHHBookingList![index]
                                          //                 .status ==
                                          //             "1") {
                                                    // ctrl.cancelVfHhBooking(
                                                    //     formid: data
                                                    //         .vofHHBookingList![
                                                    //             index]
                                                    //         .applNumber);
                                          //         } else {}
                                          //       },
                                          //       child: Center(
                                          //         child: Padding(
                                          //           padding:
                                          //               const EdgeInsets.all(8.0),
                                          //           child: Text(
                                          //             data.vofHHBookingList![index]
                                          //                         .status ==
                                          //                     "1"
                                          //                 ? "CANCEL BOOKING"
                                          //                 : "CANCELLED",
                                          //             style: TextStyle(
                                          //                 color: Colors.red,
                                          //                 fontWeight:
                                          //                     FontWeight.w700,
                                          //                 fontSize: 14),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     color: data.vofHHBookingList![index]
                                          //                 .status ==
                                          //             "1"
                                          //         ? Colors.red.withOpacity(0.05)
                                          //         : Colors.transparent,
                                          //   ),
                                          // )
                                          data.vofHHBookingList![index]
                                                          .status ==
                                                      "1"?Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                child: MainButton(
                                                  borderRadius: 5,
                                                  buttonLable: "Cancel Booking",
                                                  onTap: (){
                                                    ctrl.cancelVfHhBooking(
                                                        formid: data
                                                            .vofHHBookingList![
                                                                index]
                                                            .applNumber);
                                                  }
                                                ),
                                              ),
                                            ],
                                          ):Container()
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          var data = ctrl.adminHolidayHomeData.value;
                          return ListView.builder(
                            reverse: false,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.hhVofHisList!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 20),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12, blurRadius: 10)
                                    ]),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Submitted By User",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${data.hhVofHisList![index].bookingPlace}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${data.hhVofHisList![index].applType}",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .calendar_month,
                                                                    color: Colors
                                                                        .black54,
                                                                    size: 16,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    "Start Date",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black54),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                  "${data.hhVofHisList![index].startDate}",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          17)),
                                                            ),
                                                          ],
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .calendar_month,
                                                                    color: Colors
                                                                        .black54,
                                                                    size: 16,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    "End Date",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black54),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                  "${data.hhVofHisList![index].endDate}",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          17)),
                                                            ),
                                                          ],
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .access_time,
                                                                      color: Colors
                                                                          .black54,
                                                                      size: 16,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      "Start Time",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w600,
                                                                          color: Colors
                                                                              .black54),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                  "${data.hhVofHisList![index].startTime}",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          17)),
                                                            ),
                                                          ],
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .access_time,
                                                                      color: Colors
                                                                          .black54,
                                                                      size: 16,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      "End Time",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w600,
                                                                          color: Colors
                                                                              .black54),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                  "${data.hhVofHisList![index].endTime}",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          17)),
                                                            ),
                                                          ],
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Remarks"),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 50,
                                                        padding: EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            top: 8,
                                                            bottom: 5),
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color(0xffF6FDFF),
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xffD8E9F0)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5)),
                                                        child: Text(
                                                          "${data.hhVofHisList![index].remark}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black87),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            child: Material(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                onTap: () {
                                                  if (data.hhVofHisList![index]
                                                          .status ==
                                                      "1") {
                                                    ctrl.cancelVfHhBooking(
                                                        formid: data
                                                            .hhVofHisList![index]
                                                            .applNumber);
                                                  } else {}
                                                },
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      data.hhVofHisList![index]
                                                                  .status ==
                                                              "1"
                                                          ? "CANCEL BOOKING"
                                                          : "CANCELLED",
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              color: data.hhVofHisList![index]
                                                          .status ==
                                                      "1"
                                                  ? Colors.red.withOpacity(0.05)
                                                  : Colors.transparent,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      } else {
                        return NoData();
                      }
                    } else {
                      var data = ctrl.adminHolidayHomeData.value;
                      if (data.hhVofHisList! != null) {
                        return ListView.builder(
                          reverse: false,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.hhVofHisList!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  EdgeInsets.only(left: 15, right: 15, bottom: 20),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black12, blurRadius: 10)
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Submitted By User",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${data.hhVofHisList![index].bookingPlace}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${data.hhVofHisList![index].applType}",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .calendar_month,
                                                                  color: Colors
                                                                      .black54,
                                                                  size: 16,
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  "Start Date",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                                "${data.hhVofHisList![index].startDate}",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 17)),
                                                          ),
                                                        ],
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .calendar_month,
                                                                  color: Colors
                                                                      .black54,
                                                                  size: 16,
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  "End Date",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                                "${data.hhVofHisList![index].endDate}",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 17)),
                                                          ),
                                                        ],
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Container(
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .access_time,
                                                                    color: Colors
                                                                        .black54,
                                                                    size: 16,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    "Start Time",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black54),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                                "${data.hhVofHisList![index].startTime}",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 17)),
                                                          ),
                                                        ],
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Container(
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .access_time,
                                                                    color: Colors
                                                                        .black54,
                                                                    size: 16,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    "End Time",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black54),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                                "${data.hhVofHisList![index].endTime}",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 17)),
                                                          ),
                                                        ],
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Remarks"),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      height: 50,
                                                      padding: EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 8,
                                                          bottom: 5),
                                                      decoration: BoxDecoration(
                                                          color: Color(0xffF6FDFF),
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xffD8E9F0)),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  5)),
                                                      child: Text(
                                                        "${data.hhVofHisList![index].remark}",
                                                        style: TextStyle(
                                                            color: Colors.black87),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Material(
                                            borderRadius: BorderRadius.circular(10),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              onTap: () {
                                                if (data.hhVofHisList![index]
                                                        .status ==
                                                    "1") {
                                                  ctrl.cancelVfHhBooking(
                                                      formid: data
                                                          .hhVofHisList![index]
                                                          .applNumber);
                                                } else {}
                                              },
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    data.hhVofHisList![index]
                                                                .status ==
                                                            "1"
                                                        ? "CANCEL BOOKING"
                                                        : "CANCELLED",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            color:
                                                data.hhVofHisList![index].status ==
                                                        "1"
                                                    ? Colors.red.withOpacity(0.05)
                                                    : Colors.transparent,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return NoData();
                      }
                    }
                  } else {
                    return NoData(
                      refresh: () {
                        ctrl.getBookings();
                      },
                    );
                  }
                } else {
                  return Container(
                    child: Text("Hello"),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
