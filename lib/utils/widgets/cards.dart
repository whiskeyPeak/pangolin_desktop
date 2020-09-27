/*
Copyright 2019 The dahliaOS Authors

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

import 'package:Pangolin/utils/localization/localization.dart';
import 'package:Pangolin/utils/hiveManager.dart';
import 'package:flutter/material.dart';
import 'package:Pangolin/applications/calculator/calculator.dart';
import 'package:Pangolin/applications/containers/containers.dart';
import 'package:Pangolin/applications/files/main.dart';
import 'package:Pangolin/applications/editor/editor.dart';
import 'package:Pangolin/applications/terminal/main.dart';
import 'package:Pangolin/applications/browser/main.dart';
import 'package:Pangolin/applications/terminal/root/main.dart';
import 'package:Pangolin/applications/developer/developer.dart';
import 'package:Pangolin/desktop/settings/settings.dart';
import 'package:Pangolin/applications/monitor/monitor.dart';
import 'package:Pangolin/utils/widgets/app_launcher.dart';
import 'package:Pangolin/applications/welcome/welcome.dart';
import 'package:Pangolin/utils/others/functions.dart';
import 'package:Pangolin/applications/logging/logging.dart';

Expanded tileSection(BuildContext context) {
  Localization local = Localization.of(context);
  return Expanded(
    child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(
            horizontal: HiveManager.get("launcherWideMode") ? 100 : 350),
        child: SingleChildScrollView(
          child: Wrap(spacing: 75.0, children: [
            AppLauncherButton(
              type: AppLauncherButtonType.Drawer,
              app: TerminalApp(),
              icon: 'assets/images/icons/v2/compiled/terminal.png',
              label: local.get("app_terminal"),
              color: Colors.grey[900],
              callback: toggleCallback,
            ),
            AppLauncherButton(
              type: AppLauncherButtonType.Drawer,
              app: Tasks(),
              icon: 'assets/images/icons/v2/compiled/task.png',
              label: local.get("app_taskmanager"),
              color: Colors.cyan[900],
              callback: toggleCallback,
            ),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                app: Settings(),
                icon: 'assets/images/icons/v2/compiled/settings.png',
                label: local.get("app_settings"),
                color: Colors.deepOrange[700],
                callback: toggleCallback),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                app: RootTerminalApp(),
                icon: 'assets/images/icons/v2/compiled/root.png',
                label: local.get("app_rootterminal"),
                color: Colors.red[700],
                callback: toggleCallback),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                app: TextEditorApp(),
                icon: 'assets/images/icons/v2/compiled/notes.png',
                label: local.get("app_notes"),
                color: Colors.amber[700],
                callback: toggleCallback),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                icon: 'assets/images/icons/v2/compiled/note_mobile.png',
                label: local.get("app_notesmobile"),
                appExists: false),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                app: Logs(),
                icon: 'assets/images/icons/v2/compiled/logs.png',
                label: local.get("app_systemlogs"),
                color: Colors.red[700],
                callback: toggleCallback),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                app: Files(),
                icon: 'assets/images/icons/v2/compiled/files.png',
                label: local.get("app_files"),
                color: Colors.deepOrange[800],
                callback: toggleCallback),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                icon: 'assets/images/icons/v2/compiled/disks.png',
                label: local.get("app_disks"),
                appExists: false),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                app: Calculator(),
                icon: 'assets/images/icons/v2/compiled/calculator.png',
                label: local.get("app_calculator"),
                color: Colors.green,
                callback: toggleCallback),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                app: Containers(),
                icon: 'assets/images/icons/v2/compiled/containers.png',
                label: local.get("app_containers"),
                color: Colors.blue[800],
                callback: toggleCallback),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                app: Welcome(),
                icon:
                    'assets/images/dahliaOS/Logos/compiled/dahliaOS_logo_drop_shadow.png',
                label: local.get("app_welcome"),
                color: Colors.grey[900],
                callback: toggleCallback),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                app: DeveloperApp(),
                icon: 'assets/images/icons/v2/compiled/developer.png',
                label: 'Developer Options',
                color: Colors.red[700],
                callback: toggleCallback),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                app: BrowserApp(),
                icon: 'assets/images/icons/v2/compiled/web.png',
                label: local.get("app_web"),
                color: Colors.grey[500],
                callback: toggleCallback),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                icon: 'assets/images/icons/v2/compiled/clock.png',
                label: local.get("app_clock"),
                appExists: false),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                icon: 'assets/images/icons/v2/compiled/messages.png',
                label: local.get("app_messages"),
                appExists: false),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                icon: 'assets/images/icons/v2/compiled/music.png',
                label: local.get("app_music"),
                appExists: false),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                icon: 'assets/images/icons/v2/compiled/photos.png',
                label: local.get("app_media"),
                appExists: false),
            AppLauncherButton(
                type: AppLauncherButtonType.Drawer,
                icon: 'assets/images/icons/v2/compiled/help.png',
                label: local.get("app_help"),
                appExists: false),
          ]),
        )),
  );
}

class SysInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: new Text("Feature not implemented"),
                content: new Text(
                    "This feature is currently not available on your build of Pangolin. Please see https://reddit.com/r/dahliaos to check for updates."),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          width: 300,
          height: 100,
          child: new Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.info, color: Colors.blue, size: 20.0),
                        new Text(
                          " " + "System Information",
                          style: new TextStyle(
                              fontSize: 15.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto"),
                        )
                      ]),
                  new Text(
                    "pangolin-desktop, commit 'varCommit'",
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        splashColor: Colors.deepOrange.withAlpha(30),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: new Text("Feature not implemented"),
                content: new Text(
                    "This feature is currently not available on your build of Pangolin. Please see https://reddit.com/r/dahliaos to check for updates."),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          width: 300,
          height: 100,
          child: new Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.speaker_notes,
                            color: Colors.deepOrange, size: 20.0),
                        new Text(
                          " " + "News",
                          style: new TextStyle(
                              fontSize: 15.0,
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto"),
                        )
                      ]),
                  new Text(
                    "UNABLE TO PARSE JSON!!!",
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

Card buildCard(IconData icon, String title, Color color, Color splash,
    String text, BuildContext context) {
  return new Card(
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: InkWell(
      splashColor: splash,
      onTap: () {
        showDialog(
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Feature not implemented"),
              content: new Text(
                  "This feature is currently not available on your build of Pangolin. Please see https://reddit.com/r/dahliaos to check for updates."),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
          context: context,
        );
      },
      child: Container(
        width: 300,
        height: 100,
        child: new Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          child: SingleChildScrollView(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Icon(icon, color: color, size: 20.0),
                          new Text(
                            " " + title,
                            style: new TextStyle(
                                fontSize: 15.0,
                                color: color,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          )
                        ]),
                  ),
                  new Text(
                    text,
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                  )
                ]),
          ),
        ),
      ),
    ),
  );
}
//ok