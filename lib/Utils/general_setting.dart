import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hello24/Utils/emojiText.dart';
import 'package:hello24/Utils/signatures.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.dart';

import 'constant.dart';

class EmailBox extends StatefulWidget {
  const EmailBox({super.key});

  @override
  State<EmailBox> createState() => _EmailBoxState();
}

class _EmailBoxState extends State<EmailBox> with TickerProviderStateMixin {
  double mainBoxWidth = 0;
  late TabController tabController;
  List<String> inUseItems = [];
  List<String> notInUseItems = hearts + icons;

  @override
  void initState() {
    super.initState();
    notInUseItems.sort();
    tabController = TabController(initialIndex: 0, length: 11, vsync: this);
  }

  String language = '';
  String? value1;
  String? value2;
  String? value3;
  double fontSize = 1.0;
  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  bool colorPicker = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    setState(() {
      mainBoxWidth = w - 125;
    });
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: h - h * 0.07,
      width: mainBoxWidth,
      margin: const EdgeInsets.only(left: 65, right: 60),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 12,
            top: 12,
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: const EdgeInsets.only(left: 10),
                  controller: tabController,
                  isScrollable: true,
                  tabs: const [
                    Tab(
                      child: Text(
                        "General",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Labels",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Inbox",
                        maxLines: 1, // Set maxLines to 1
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Accounts and Import",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Filters and Blocked Addresses",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Forwarding and POP/IMAP",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Add-ons",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Chat and Meet",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Advanced",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Offline",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Themes",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Expanded(
                  child: TabBarView(controller: tabController, children: [
                    ListView.builder(
                        itemCount: strings.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: w,
                                height: index == 4 ? 360 : 120,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 10,
                                      top: 2,
                                      child: Text(
                                        '${strings[index]}:',
                                        style: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 2),
                                      child: const Positioned(
                                        left: 10,
                                        top: 15,
                                        width: 120,
                                        height: 60,
                                        child: Text(
                                          '(Use the "Remove formatting" button on the toolbar to reset the default text style)',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.0,
                                          ),
                                          maxLines: 4,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 240,
                                      top: 2,
                                      child: Text(
                                        '${value[index]}',
                                        style: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 0),
                                      child: Positioned(
                                        left: 400,
                                        top: 1,
                                        child: Container(
                                          width: 220,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: LanguagePickerDropdown(
                                            initialValue: Languages.english,
                                            onValuePicked: (Language language) {
                                              print(language.name);
                                            },
                                            itemBuilder: _buildDialogItem,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 0),
                                      child: const Positioned(
                                        left: 640,
                                        top: 2,
                                        child: Text(
                                          'Change language settings for other Google products',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 2),
                                      child: Container(
                                        width: 300,
                                        height: 60,
                                        margin:
                                            const EdgeInsets.only(left: 240),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 5.0,
                                              spreadRadius: 3.0,
                                              offset: Offset(0,
                                                  4), // Adjust the offset as needed
                                            ),
                                          ],
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 120,
                                                  height: 15,
                                                  margin: const EdgeInsets.only(
                                                      left: 5, top: 5),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton<String>(
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10,
                                                      ),
                                                      dropdownColor:
                                                          Colors.white,
                                                      menuMaxHeight: 300,
                                                      hint: const Text(
                                                        "Sans Serif",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      isExpanded: true,
                                                      value: value2,
                                                      autofocus: true,
                                                      items: fontFamily
                                                          .map(buildMenuItem)
                                                          .toList(),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          value2 = value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 75,
                                                  height: 15,
                                                  margin: const EdgeInsets.only(
                                                      left: 0, top: 5),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton<String>(
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10,
                                                      ),
                                                      dropdownColor:
                                                          Colors.white,
                                                      menuMaxHeight: 300,
                                                      hint: const Text(
                                                        "ᵀT",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 10),
                                                      ),
                                                      isExpanded: true,
                                                      value: value3,
                                                      autofocus: true,
                                                      items: size
                                                          .map(buildMenuItem)
                                                          .toList(),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          value3 = value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      colorPicker =
                                                          !colorPicker;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 10,
                                                    height: 20,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 5, top: 5),
                                                    child: const Center(
                                                      child: Text(
                                                        'A',
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            fontSize: 10),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  height: 20,
                                                  margin: const EdgeInsets.only(
                                                      left: 5, top: 5),
                                                  child: const Text('en'),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10, top: 10),
                                              child: const Text(
                                                'This is what your body text will look like',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 0),
                                      child: const Positioned(
                                        left: 240,
                                        top: 20,
                                        child: Text(
                                          'Show all language options',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 1),
                                      child: Positioned(
                                        left: 400,
                                        top: 2,
                                        child: Container(
                                          width: 200,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                              iconEnabledColor: Colors.white,
                                              dropdownColor: Colors.white,
                                              hint: const Text(
                                                "India",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              isExpanded: true,
                                              value: value1,
                                              items: countryName
                                                  .map(buildMenuItem)
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  value1 = value!;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 3),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            child: Container(
                                                width: 700,
                                                height: 40,
                                                margin: const EdgeInsets.only(
                                                    left: 240),
                                                child: const Text.rich(
                                                    TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          'Drag the stars between the lists.',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14)),
                                                  TextSpan(
                                                      text:
                                                          'The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.',
                                                      style: TextStyle(
                                                          fontSize: 14))
                                                ]))),
                                          ),
                                          Positioned(
                                            top: 40,
                                            child: Container(
                                              width: 700,
                                              height: 20,
                                              margin: const EdgeInsets.only(
                                                  left: 240),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text('Presets:',
                                                      style: TextStyle(
                                                          fontSize: 14)),
                                                  const SizedBox(
                                                    width: 24,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        inUseItems = ['💛'];
                                                        notInUseItems =
                                                            hearts + icons;
                                                        notInUseItems
                                                            .remove('💛');
                                                        notInUseItems.sort();
                                                      });
                                                    },
                                                    child: const Text('1 star',
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 14)),
                                                  ),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        inUseItems = [
                                                          '💛',
                                                          '🩷',
                                                          '💙',
                                                          '💜'
                                                        ];
                                                        notInUseItems =
                                                            hearts + icons;
                                                        notInUseItems
                                                          ..remove('💛')
                                                          ..remove('🩷')
                                                          ..remove('💙')
                                                          ..remove('💜');
                                                        inUseItems.sort();
                                                        notInUseItems.sort();
                                                      });
                                                    },
                                                    child: const Text('4 star',
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 14)),
                                                  ),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        inUseItems =
                                                            hearts + icons;
                                                        notInUseItems = [];
                                                        inUseItems.sort();
                                                      });
                                                    },
                                                    child: const Text(
                                                        'all stars',
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 14)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 60,
                                            child: Container(
                                              width: 80,
                                              height: 25,
                                              margin: const EdgeInsets.only(
                                                left: 240,
                                              ),
                                              child: const Text(
                                                'In use:',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 85,
                                            child: Container(
                                              width: 80,
                                              height: 25,
                                              margin: const EdgeInsets.only(
                                                left: 240,
                                              ),
                                              child: const Text(
                                                'Not in use:',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 60,
                                            left: 320,
                                            child: DragTarget<String>(
                                              onLeave: (data) {
                                                inUseItems.remove(data);
                                                setState(() {
                                                  inUseItems.sort();
                                                  notInUseItems.sort();
                                                });
                                              },
                                              onAccept: (data) {
                                                setState(() {
                                                  if (inUseItems
                                                          .contains(data) ==
                                                      false) {
                                                    inUseItems.add(data);
                                                  } else {
                                                    inUseItems.remove(data);
                                                  }
                                                  inUseItems.sort();
                                                  notInUseItems.sort();
                                                });
                                              },
                                              builder: (context, candidateData,
                                                  rejectedData) {
                                                return Container(
                                                  height: 24,
                                                  width: 480,
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        inUseItems.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final item =
                                                          inUseItems[index];
                                                      return Draggable<String>(
                                                        data: item,
                                                        child:
                                                            _buildItem(item)!,
                                                        feedback: _buildItem(
                                                            item,
                                                            isDragging: true)!,
                                                        childWhenDragging:
                                                            Container(),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Positioned(
                                            top: 85,
                                            left: 320,
                                            child: DragTarget<String>(
                                              onLeave: (data) {
                                                notInUseItems.remove(data);

                                                setState(() {
                                                  inUseItems.sort();
                                                  notInUseItems.sort();
                                                });
                                              },
                                              onAccept: (data) {
                                                setState(() {
                                                  if (notInUseItems
                                                          .contains(data) ==
                                                      false) {
                                                    notInUseItems.add(data);
                                                  } else {
                                                    notInUseItems.remove(data);
                                                  }
                                                  inUseItems.sort();
                                                  notInUseItems.sort();
                                                });
                                              },
                                              builder: (context, candidateData,
                                                  rejectedData) {
                                                return Row(
                                                  children: [
                                                    Container(
                                                      height: 24,
                                                      width: 480,
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: notInUseItems
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          final item =
                                                              notInUseItems[
                                                                  index];
                                                          return Draggable<
                                                              String>(
                                                            data: item,
                                                            child: _buildItem(
                                                                item)!,
                                                            feedback:
                                                                _buildItem(item,
                                                                    isDragging:
                                                                        true)!,
                                                            childWhenDragging:
                                                                Container(),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                        visible: (index == 4),
                                        child: Container(
                                            color: Colors.white,
                                            margin: EdgeInsets.only(left: 240),
                                            child: const Signature()))
                                  ],
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        }),
                    const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                  ]),
                )
              ],
            ),
          ),
          Visibility(
            visible: colorPicker,
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

  Widget _buildDialogItem(Language language) => Row(
        children: <Widget>[
          Text(
            language.name,
            style: TextStyle(fontSize: 10),
          ),
          const SizedBox(width: 8.0),
          Flexible(
              child: Text(
            "(${language.isoCode})",
            style: TextStyle(fontSize: 10),
          ))
        ],
      );
}

Widget? _buildItem(String item, {bool isDragging = false}) {
  return Container(
    width: 24,
    height: 16,
    padding: EdgeInsets.all(2),
    margin: EdgeInsets.all(2),
    color: isDragging ? Colors.transparent : Colors.white,
    child: EmojiText(
      text: item,
    ),
  );
}
