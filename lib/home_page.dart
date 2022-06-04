// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables,sort_child_properties_last

import 'package:database_integration/controller/Note.dart';
import 'package:database_integration/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Note? note;
  bool isDarkTheme = true;
  String userName = "";
  String email = "";

  @override
  void initState() {
    super.initState();
  }

  void changeThemeMode() {
    if (isDarkTheme) {
      Get.changeThemeMode(ThemeMode.light);
      isDarkTheme = false;
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      isDarkTheme = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database Integration"),
        actions: [
          ElevatedButton(
            child: isDarkTheme
                ? Icon(Icons.light_mode_sharp)
                : Icon(Icons.dark_mode),
            onPressed: () => changeThemeMode(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: TextField(
                onChanged: (value) {
                  userName = value;
                },
                onEditingComplete: () {
                  setState(() {});
                },
                decoration: InputDecoration(
                  label: Text("Username"),
                  hintText: "Enter Username",
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                onEditingComplete: () {
                  setState(() {});
                },
                decoration: InputDecoration(
                  label: Text("email"),
                  hintText: "Enter email",
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (userName != "" || email != "") {
                    await DatabaseHelper.addData(
                        Note(username: userName, email: email));
                    setState(() {});
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Username or Email is empty."),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
                child: Text("insert Data into Table")),
            ElevatedButton(
              onPressed: () async {
                await DatabaseHelper.getAllNotes();
                setState(() {});
              },
              child: Text("     Update Data list     "),
            ),

            // List View of DATA
            Expanded(
              child: FutureBuilder<List<Note>?>(
                future: DatabaseHelper.getAllNotes(),
                builder: (context, AsyncSnapshot<List<Note>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text(snapshot.data![index].username.toString()),
                          subtitle:
                              Text(snapshot.data![index].email.toString()),
                          trailing: InkWell(
                            onTap: () async {
                              DatabaseHelper.deleteData(snapshot.data![index]);
                              setState(() {});
                            },
                            child: Icon(
                              Icons.delete,
                              color: Color(0xFF9A6AFF),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Text("data");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
