import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class Signature extends StatefulWidget {
  const Signature({super.key});

  @override
  State<Signature> createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
  HtmlEditorController controller = HtmlEditorController();
  List<Map<String, String>> signatures = [];
  int selectedIndex = -1;

  Future<void> _showCreateSignatureDialog(BuildContext context) async {
    String newSignatureName = '';

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create New Signature'),
          content: TextField(
            onChanged: (value) {
              newSignatureName = value;
            },
            decoration: InputDecoration(labelText: 'Signature Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  signatures.add({
                    'name': newSignatureName,
                    'value': '',
                  });
                });
                controller.clear();
                Navigator.of(context).pop();
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: signatures.isNotEmpty,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    height: 200,
                    width: 220,
                    child: ListView.builder(
                        itemCount: signatures.length,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            InkWell(
                              onTap: () {
                                selectedIndex = index;
                                print(signatures[selectedIndex]['value']);
                                controller.setText(
                                    signatures[selectedIndex]['value']!);
                              },
                              child: Container(
                                height: 40,
                                color: Color(0xffE9F1FD),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('${signatures[index]['name']}'),
                                      const SizedBox(
                                        width: 80,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.setText(
                                              signatures[index]['value']!);
                                          controller.setFocus();
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.edit),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          signatures.removeAt(index);
                                          controller.clear();
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.delete),
                                      ),
                                    ]),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ]);
                        }),
                  ),
                  Container(
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: HtmlEditor(
                      controller: controller, //required
                      htmlEditorOptions: const HtmlEditorOptions(
                        hint: "Your text here...",
                        //initalText: "text content initial, if any",
                      ),
                      htmlToolbarOptions: const HtmlToolbarOptions(
                        toolbarPosition: ToolbarPosition.belowEditor,
                      ),
                      otherOptions: const OtherOptions(
                        height: 200,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 220,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: TextButton(
                    child: const Text(
                      '+   Create new',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      _showCreateSignatureDialog(context);
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: TextButton(
                    child: const Text(
                      'Done',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      String val = await controller.getText();
                      selectedIndex = signatures.length - 1;
                      if (selectedIndex != -1) {
                        signatures[selectedIndex]['value'] = val;
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
