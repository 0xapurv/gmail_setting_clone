import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello24/Utils/general_setting.dart';

class GmailSetting extends StatefulWidget {
  const GmailSetting({super.key});

  @override
  State<GmailSetting> createState() => _GmailSettingState();
}

class _GmailSettingState extends State<GmailSetting>
    with TickerProviderStateMixin {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 950;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 950;
  double isMobileHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  bool toHide(BuildContext context) => MediaQuery.of(context).size.width > 550;
  bool _isHovered = false;
  final TextEditingController _controllerSearch = TextEditingController();

  bool myDrawer = false;
  bool openMyDrawer = false;
  bool taskComplete = false;
  double width = 65;
  int _start = 0;
  late Timer _timer;
  int mainBoxWidth = 800;

  void time() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (Timer timer) {
        if (_start == 1) {
          setState(() {
            timer.cancel();
            myDrawer = true;
            _start = 0;
          });
        } else {
          setState(() {
            _start++;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.05,
              color: Colors.grey.shade100,
              child: Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            openMyDrawer = !openMyDrawer;
                          });
                          if (openMyDrawer) {
                            setState(() {
                              width = 200;
                            });
                            Future.delayed(const Duration(milliseconds: 850))
                                .then((value) {
                              setState(() {
                                myDrawer = !myDrawer;
                              });
                            });
                          } else {
                            myDrawer = false;
                            width = 65;
                          }
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: w * 0.01),
                        child: Image.asset(
                          "gmail.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: w * 0.008,
                      ),
                      Text(
                        "Gmail",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    width: isDesktop(context) ? 600 : 220,
                    height: h * 0.04,
                    margin: const EdgeInsets.only(left: 60),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.015),
                          child: const Icon(
                            Icons.search,
                            size: 20,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: w * 0.01, bottom: h * 0.011),
                          width: isMobile(context) ? w * 0.15 : w * 0.2,
                          child: TextFormField(
                            controller: _controllerSearch,
                            decoration: const InputDecoration(
                              hintText: 'Search mail',
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Padding(
                          padding: isMobile(context)
                              ? const EdgeInsets.only(right: 8)
                              : const EdgeInsets.only(right: 8),
                          child: const Icon(
                            Icons.tune,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Visibility(
                    visible: toHide(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.help_outline),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.apps),
                        ),
                        Container(
                          width: w * 0.03,
                          height: h * 0.03,
                          margin: const EdgeInsets.only(right: 15),
                          alignment: Alignment.centerRight,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          // child: Image.asset('gmail.png'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  const EmailBox(),
                  MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        width = 200.0;
                      });
                      time();
                    },
                    onExit: (_) => setState(() {
                      if (_start < 850) {
                        _timer.cancel();
                        myDrawer = false;
                      }
                      width = 65.0;
                    }),
                    child: AnimatedContainer(
                      width: width,
                      height: h - h * 0.05,
                      duration: const Duration(milliseconds: 340),
                      color: Colors.grey.shade100,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            MouseRegion(
                              onEnter: (_) => setState(() => _isHovered = true),
                              onExit: (_) => setState(() => _isHovered = false),
                              child: myDrawer
                                  ? Container(
                                      height: h * 0.05,
                                      width: 120,
                                      margin: const EdgeInsets.only(
                                          right: 50, top: 30),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade100,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: _isHovered
                                            ? const [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 5.0,
                                                  spreadRadius: 3.0,
                                                  offset: Offset(0,
                                                      4), // Adjust the offset as needed
                                                ),
                                              ]
                                            : [],
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                              Icons.mode_edit_outline_outlined),
                                          Text("Compose"),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      height: h * 0.05,
                                      width: 60,
                                      margin: const EdgeInsets.only(
                                          right: 0, top: 30),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade100,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: _isHovered
                                            ? const [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 5.0,
                                                  spreadRadius: 3.0,
                                                  offset: Offset(0,
                                                      4), // Adjust the offset as needed
                                                ),
                                              ]
                                            : [],
                                      ),
                                      child: const Center(
                                        child: Icon(
                                            Icons.mode_edit_outline_outlined),
                                      ),
                                    ),
                            ),
                            InkWell(
                                onTap: () {},
                                child: Container(
                                  width: w,
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 25.0),
                                        child: Icon(
                                          Icons.inbox,
                                          size: 15,
                                        ),
                                      ),
                                      Visibility(
                                        visible: myDrawer,
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            "Inbox",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: myDrawer,
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 73.0),
                                          child: Text(
                                            "1300",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: w,
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 25.0),
                                      child: Icon(
                                        Icons.star_border,
                                        size: 15,
                                      ),
                                    ),
                                    Visibility(
                                      visible: myDrawer,
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 15.0),
                                        child: Text("Starred"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: w,
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 25.0),
                                      child: Icon(
                                        Icons.access_time,
                                        size: 15,
                                      ),
                                    ),
                                    Visibility(
                                      visible: myDrawer,
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 15.0),
                                        child: Text("Snoozed"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {},
                                child: Container(
                                  width: w,
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 25.0),
                                        child: Icon(
                                          Icons.send,
                                          size: 15,
                                        ),
                                      ),
                                      Visibility(
                                        visible: myDrawer,
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Text("Sent"),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            InkWell(
                                onTap: () {},
                                child: Container(
                                  width: w,
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 25.0),
                                        child: Icon(
                                          Icons.insert_page_break_outlined,
                                          size: 15,
                                        ),
                                      ),
                                      Visibility(
                                        visible: myDrawer,
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            "Drafts",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: myDrawer,
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 73.0),
                                          child: Text(
                                            "50",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: w,
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 25.0),
                                      child: Icon(
                                        Icons.arrow_downward_sharp,
                                        size: 15,
                                      ),
                                    ),
                                    Visibility(
                                      visible: myDrawer,
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 15.0),
                                        child: Text("More"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            myDrawer
                                ? Visibility(
                                    visible: !(isMobileHeight(context) < 254),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 25.0, top: 20),
                                          child: Text(
                                            "Labels",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 85.0, top: 20),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.add,
                                              size: 20,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : IconButton(
                                    icon: const Icon(
                                      Icons.add,
                                      size: 20,
                                    ),
                                    onPressed: () {},
                                  ),
                            InkWell(
                              onTap: () {},
                              child: Visibility(
                                visible: !(isMobileHeight(context) < 288),
                                child: Container(
                                  width: w,
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 25.0),
                                        child: Icon(
                                          Icons.delete_outline_sharp,
                                          size: 15,
                                        ),
                                      ),
                                      Visibility(
                                        visible: myDrawer,
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Text("[Imap]/trash"),
                                        ),
                                      ),
                                      Visibility(
                                        visible: myDrawer,
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 30.0),
                                          child: Text(
                                            "1300",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: h - h * 0.05,
                      width: 55,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Image.asset(
                                'calender.png',
                                scale: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Image.asset(
                                'keep.png',
                                scale: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Image.asset(
                                'tasks.png',
                                scale: 25,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Image.asset(
                                'teams.png',
                                scale: 25,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add)),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
