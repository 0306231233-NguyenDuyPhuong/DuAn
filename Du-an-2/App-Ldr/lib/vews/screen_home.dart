import 'package:app_ldr/viewmodels/viewmodel_ldr.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../service/service_ldr.dart';
import '../widgets/app_colors.dart';
import '../widgets/container_appbar.dart';
import '../widgets/container_bottom.dart';
import '../widgets/container_chart.dart';
import '../widgets/container_led.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _db = FirebaseDatabase.instance.ref();

  int ldr1 = 0;
  int ldr2 = 0;
  int ldr3 = 0;

  late bool isControlLed1;
  late bool isControlLed2;
  late bool isControlLed3;
  late bool isControlLed4;
  late bool isControlLed5;
  late bool isControlLed6;
  late bool isWarning = false;
  late bool isCheckConvert = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<CombinedData>(
        stream: LdrViewModel().combinedStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          final ldr = data.ldr;
          final led = data.led;
          final load = data.load;

          isControlLed1 = led.led1;
          isControlLed1 = led.led1;
          isControlLed2 = led.led2;
          isControlLed3 = led.led3;
          isControlLed4 = led.led4;
          isControlLed5 = led.led5;
          isControlLed6 = led.led6;
          isWarning = load.buzzer;
          isCheckConvert = load.auto;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
              child: Column(
                children: [
                  MyAppBar(),
                  //Chart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("", style: TextStyle(fontSize: 20)),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  //Container
                  SimpleBarChart(),

                  const SizedBox(height: 20),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ContainerLed(
                              height: 270,
                              width: 190,
                              color: Colors.white,
                              childSwitch1: Switch(
                                value: isControlLed1,
                                activeColor: AppColor.kPrimaryPurpleStart,
                                trackOutlineColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                inactiveTrackColor: AppColor.kPrimaryPurpleStart
                                    .withOpacity(0.1),
                                inactiveThumbColor:
                                    AppColor.kPrimaryPurpleStart,
                                onChanged: (bool value) {
                                  (isCheckConvert==false)
                                      ? (LdrViewModel().updateLed(
                                          "LED_1",
                                          !isControlLed1,
                                        ))
                                      : (isControlLed1 = isControlLed1);
                                },
                              ),
                              childSwitch2: Switch(
                                value: isControlLed2,
                                activeColor: AppColor.kPrimaryPurpleStart,
                                trackOutlineColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                inactiveTrackColor: AppColor.kPrimaryPurpleStart
                                    .withOpacity(0.1),
                                inactiveThumbColor:
                                    AppColor.kPrimaryPurpleStart,
                                onChanged: (bool value) {
                                  setState(() {
                                    (isCheckConvert==false)
                                        ? (LdrViewModel().updateLed(
                                            "LED_2",
                                            !isControlLed2,
                                          ))
                                        : (isControlLed2 = led.led2);
                                  });
                                },
                              ),
                              isCheck1: isControlLed1,
                              isCheck2: isControlLed2,
                              title: "Sân trước",
                              ldr: ldr.ldr1.toInt(),
                            ),
                            ContainerLed(
                              height: 270,
                              width: 190,
                              color: Colors.white,
                              childSwitch1: Switch(
                                value: isControlLed3,
                                activeColor: AppColor.kPrimaryPurpleStart,
                                trackOutlineColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                inactiveTrackColor: AppColor.kPrimaryPurpleStart
                                    .withOpacity(0.1),
                                inactiveThumbColor:
                                    AppColor.kPrimaryPurpleStart,
                                onChanged: (bool value) {
                                  setState(() {
                                    (isCheckConvert==false)
                                        ? (LdrViewModel().updateLed(
                                            "LED_3",
                                            !isControlLed3,
                                          ))
                                        : (isControlLed3 = isControlLed3);
                                  });
                                },
                              ),
                              childSwitch2: Switch(
                                value: isControlLed4,
                                activeColor: AppColor.kPrimaryPurpleStart,
                                trackOutlineColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                inactiveTrackColor: AppColor.kPrimaryPurpleStart
                                    .withOpacity(0.1),
                                inactiveThumbColor:
                                    AppColor.kPrimaryPurpleStart,
                                onChanged: (bool value) {
                                  setState(() {
                                    (isCheckConvert==false)
                                        ? (LdrViewModel().updateLed(
                                            "LED_4",
                                            !isControlLed4,
                                          ))
                                        : (isControlLed4 = isControlLed4);
                                  });
                                },
                              ),
                              isCheck1: isControlLed3,
                              isCheck2: isControlLed4,
                              title: "Nhà trên",
                              ldr: ldr.ldr2.toInt(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ContainerLed(
                              height: 270,
                              width: 190,
                              color: Colors.white,
                              childSwitch1: Switch(
                                value: isControlLed5,
                                activeColor: AppColor.kPrimaryPurpleStart,
                                trackOutlineColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                inactiveTrackColor: AppColor.kPrimaryPurpleStart
                                    .withOpacity(0.1),
                                inactiveThumbColor:
                                    AppColor.kPrimaryPurpleStart,
                                onChanged: (bool value) {
                                  setState(() {
                                    (isCheckConvert==false)
                                        ? (LdrViewModel().updateLed(
                                            "LED_5",
                                            !isControlLed5,
                                          ))
                                        : (isControlLed5 = isControlLed5);
                                  });
                                },
                              ),
                              childSwitch2: Switch(
                                value: isControlLed6,
                                activeColor: AppColor.kPrimaryPurpleStart,
                                trackOutlineColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                inactiveTrackColor: AppColor.kPrimaryPurpleStart
                                    .withOpacity(0.1),
                                inactiveThumbColor:
                                    AppColor.kPrimaryPurpleStart,
                                onChanged: (bool value) {
                                  setState(() {
                                    (isCheckConvert==false)
                                        ? (LdrViewModel().updateLed(
                                            "LED_6",
                                            !isControlLed6,
                                          ))
                                        : (isControlLed6 = isControlLed6);
                                  });
                                },
                              ),
                              isCheck1: isControlLed5,
                              isCheck2: isControlLed6,
                              title: "Nhà sau",
                              ldr: ldr.ldr3.toInt(),
                            ),
                            Container(
                              height: 270,
                              width: 190,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                border: Border.all(
                                  color: AppColor.kPrimaryPurpleEnd,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Iconsax.notification,
                                    size: 150,
                                    color: isWarning ? Colors.red : Colors.grey,
                                  ),
                                  Text(
                                    "Cảnh báo",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: isWarning
                                          ? Colors.red
                                          : Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: ContainerBottom(
        handler: () {
          setState(() {
            isCheckConvert = !isCheckConvert;
            _db.child("auto").set(isCheckConvert);
          });
        },
        icon: Icon(
          Iconsax.convertshape,
          size: 40,
          color: isCheckConvert ? Colors.grey:AppColor.kPrimaryPurpleEnd,
        ),
      ),
    );
  }
}
