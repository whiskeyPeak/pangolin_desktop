/*
Copyright 2021 The dahliaOS Authors
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import 'dart:ui';

import 'package:dahlia_backend/dahlia_backend.dart';
import 'package:flutter/material.dart';
import 'package:pangolin/widgets/settingsTile.dart';
import 'package:pangolin/widgets/settingsheader.dart';
import 'package:provider/provider.dart';

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _data = Provider.of<PreferenceProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "Display",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto"),
                  )),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingsHeader(heading: "Screen"),
                    SettingsTile(
                      children: [
                        Text("Set your screen brightness"),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Slider(
                                  divisions: 20,
                                  label:
                                      "${(_data.brightness * 100).toString()}%",
                                  onChanged: (double state) {
                                    _data.brightness = state;
                                  },
                                  value: _data.brightness,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SettingsHeader(heading: "Blue light filter"),
                    SettingsTile(
                      children: [
                        SwitchListTile(
                          secondary: Icon(Icons.remove_red_eye_outlined),
                          onChanged: (bool value) {
                            _data.enableBluelightFilter =
                                !_data.enableBluelightFilter;
                          },
                          value: _data.enableBluelightFilter,
                          title: Text(
                              "Enable blue light filter to protect your eyes"),
                        ),
                      ],
                    ),
                    SettingsHeader(heading: "Resolution"),
                    AbsorbPointer(
                      child: SettingsTile(
                        children: [
                          Text("Adjust your screen resolution"),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Slider(
                                        divisions: 20,
                                        onChanged: (double state) {},
                                        value: 0.75,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 200,
                                      width: 400,
                                      color: Colors.grey,
                                      child: Center(
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.grey[350],
                                          ),
                                          child: Center(
                                            child: Text(
                                              "1",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 200,
                                      width: 400,
                                      color: Colors.grey,
                                      child: Center(
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.grey[350],
                                          ),
                                          child: Center(
                                            child: Text(
                                              "2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                                //TODO put into Alert Dialog for Help
                                /*Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "You can adjust your Screen Resolution to to your personal feelings. \nThe Image to the right shows you information about different Screen Reolutions.",
                              style: TextStyle(fontSize: 17, letterSpacing: 0.2),
                            ),
                            Image.network(
                              "https://www.logicalincrements.com/assets/img/peripherals/screen/resolutions_1200.png",
                              height: 300,
                            ),
                          ],
                        ),*/
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
