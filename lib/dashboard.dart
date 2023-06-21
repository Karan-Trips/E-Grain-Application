import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginuicolors/Grain_type.dart';
import 'package:loginuicolors/Homepage.dart';
import 'package:loginuicolors/oldlogin.dart';
import 'package:http/http.dart' as http;
import 'package:loginuicolors/progressindicator.dart';

import 'dashboard_new.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static String? id;

  @override
  Widget build(BuildContext context) {
    id = (ModalRoute.of(context)!.settings.arguments as dynamic)["id"];
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Center(child: Text("Dashboard")),
      ),
      drawer: new Drawer(
        backgroundColor: Colors.lightGreen[200],
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName: new Text("Name : Karan"),
              accountEmail: Text("Email : karanboss652@gmail.com"),
              onDetailsPressed: () {},
              arrowColor: Colors.red,
              decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              currentAccountPicture: ClipOval(
                clipBehavior: Clip.antiAliasWithSaveLayer,

                child: Image.network(
                    "https://th.bing.com/th/id/OIP.BFI0AlkD3gvGdl5LP2B5ugHaHa?pid=ImgDet&rs=1"),

                // radius: 25,
              ),
            ),
            Text(
              "---- Detail-View ----",
              textAlign: TextAlign.center,
            ),
            new Divider(
              height: 20,
            ),
            new ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: .8),
                borderRadius: BorderRadius.circular(50), //<-- SEE HERE
              ),
              title: Text("Grain-Type"),
              trailing: new Icon(Icons.list_alt_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Grain_type()),
                );
              },
              //
            ),
            new Divider(
              color: Colors.transparent,
              height: 10,
            ),
            new ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: .8),
                borderRadius: BorderRadius.circular(50), //<-- SEE HERE
              ),
              title: Text("Setting"),
              trailing: new Icon(Icons.settings_sharp),
              onTap: () {
                print("ok");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
            ),
            new Divider(
              color: Colors.transparent,
              height: 10,
            ),
            new ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: .8),
                borderRadius: BorderRadius.circular(50), //<-- SEE HERE
              ),
              title: Text("Profile-Setting"),

              // tileColor: Colors.b,
              trailing: new Icon(Icons.display_settings_outlined),
              onTap: () {
                Circular_indecator();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsUI()),
                );
              },
            ),
            new Divider(
              color: Colors.transparent,
              height: 10,
            ),
            new ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: .8),
                borderRadius: BorderRadius.circular(50), //<-- SEE HERE
              ),
              title: Text("Track Order"),

              // tileColor: Colors.b,
              trailing: new Icon(Icons.spatial_tracking_sharp),
              onTap: () => {
                print("track"),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderTrackingPage()),
                ),
              },
            ),
            new Divider(
              color: Colors.transparent,
              height: 10,
            ),
            new ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: .8),
                borderRadius: BorderRadius.circular(50), //<-- SEE HERE
              ),
              title: Text("Transaction"),

              // tileColor: Colors.b,
              trailing: new Icon(Icons.attach_money_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardPage()),
              ),
            ),
            // Text(
            //   "--LOG-OUT--",
            //   textAlign: TextAlign.center,
            // ),
            new Divider(
              color: Colors.transparent,
              height: 40,
            ),
            new ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: .8),
                borderRadius: BorderRadius.circular(50), //<-- SEE HERE
              ),
              title: Text("Log-Out"),
              trailing: new Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyLoginState()),
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            new Text(
              "----- About-Us -----",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Contact At - 123456789\n\tAddress - Nehrunagr",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 80,
                  child: Center(
                      child: Text(
                    "Dashboard",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ))),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Wrap(
                    spacing: 50,
                    runSpacing: 50,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 160,
                        child: Card(
                          elevation: 20.2,
                          color: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfilePage()),
                                );
                                print("ok");
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Profile-Setting",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          elevation: 20.2,
                          color: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardPage()),
                                );
                                // #############3
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Transaction",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          elevation: 20.2,
                          color: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OrderTrackingPage()),
                                );
                                // ######################
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Order Detail",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          elevation: 20.2,
                          color: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage()));
                                // ##########################
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Buy Grain",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// ##################################################################
// #############################################################3
// ############################################################

//        //// PROFILE PAGE ////

// ########################################################3
// ###########################################################3
// ##############################################################
// ###############################################################3

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ImagePicker _picker = ImagePicker();
  bool showPassword = true;
  String? id = _DashboardState.id;
  dynamic data;

  Future<dynamic> get() async {
    print(id);
    var res = await http
        .get(Uri.parse("https://grain-e.000webhostapp.com/show.php?id=$id"));

    return jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      Future.delayed(Duration.zero, () async {
        showDialog(
            context: context,
            builder: (context) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color: Colors.red,
              ));
            });
      });

      get().then((value) {
        Navigator.of(context).pop();
        setState(() {
          data = value;
          print(data);
        });
      });
    } else {}

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile-Setting"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 1,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfileSettings(),
                  ));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Center(
                      child: Stack(children: [
                        FullScreenWidget(
                          disposeLevel: DisposeLevel.High,
                          child: CircleAvatar(
                              radius: 90,
                              backgroundImage: data != null &&
                                      data['image'] != null
                                  ? NetworkImage(
                                      "https://grain-e.000webhostapp.com/${data["image"]}")
                                  : null),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField(
                  "Full Name", data == null ? "null" : data['fullname'], false),
              buildTextField(
                  "E-mail", data == null ? "null" : data['email'], false),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: Text("----- Address -----"),
                ),
              ),
              buildTextField(
                  "Street",
                  data != null && data['street'] != null
                      ? data['street']
                      : "null",
                  false),
              buildTextField(
                  "Landmark",
                  data != null && data['landmark'] != null
                      ? data['landmark']
                      : "null",
                  false),
              buildTextField(
                  "pincode",
                  data != null && data['pincode'] != null
                      ? data['pincode']
                      : "null",
                  false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), elevation: 5),
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Dashboard()));
                      Navigator.pop(context);
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), elevation: 5),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => update()));
                    },
                    child: Text("Update profile",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void takephoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
        source: source, preferredCameraDevice: CameraDevice.front);
    setState(() {});
  }

  Widget bottomSheet() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Choose Profile Pics",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                alignment: Alignment.center,
                onPressed: () {
                  takephoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
              ),
              Text("Camera"),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  takephoto(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
              ),
              Text("Image"),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}

// ignore: camel_case_types
class update extends StatefulWidget {
  update({Key? key}) : super(key: key);

  @override
  State<update> createState() => _updateState();
}

// ignore: camel_case_types
class _updateState extends State<update> {
  String? id = _DashboardState.id;
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _fname = TextEditingController();
  final image = TextEditingController();
  final street = TextEditingController();
  final landmark = TextEditingController();
  final pincode = TextEditingController();
  XFile? _imagefile;
  final ImagePicker _picker = ImagePicker();
  void takephoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
        source: source, preferredCameraDevice: CameraDevice.front);
    setState(() {
      _imagefile = pickedFile;
    });
  }

  Widget bottomSheet() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Choose Profile Pics",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                alignment: Alignment.center,
                onPressed: () {
                  takephoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
              ),
              Text("Camera"),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  takephoto(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
              ),
              Text("Image"),
            ],
          )
        ],
      ),
    );
  }

  Future<void> updateRecord() async {
    if (_email.text != "" || _pass.text != "" || _fname.text != "") {
      try {
        String uri = "https://grain-e.000webhostapp.com/updateR.php?id=$id";
        var res = new http.MultipartRequest("POST", Uri.parse(uri));

        var file = File(_imagefile!.path);
        res.files.add(http.MultipartFile.fromBytes(
            'image', file.readAsBytesSync(),
            filename: file.path.split('/').last));
        res.fields.addAll({
          "fullname": _fname.text,
          "email": _email.text,
          "password": _pass.text,
          "street": street.text,
          "landmark": landmark.text,
          "pincode": pincode.text,
        });
        dynamic response;
        res.send().then((value) => value.stream.bytesToString().then((value) {
              print(value);
              response = jsonDecode(value);
              print(response);

              if (response["success"] == "true") {
                print("Record Updated");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green[300],
                    elevation: 10,
                    duration: Duration(seconds: 1),
                    content: Text("Updating profile..."),
                  ),
                );
                Navigator.popUntil(
                    context, (route) => route.settings.name == "Dashboard");
              } else {
                print("Kuch galt hi");
              }
            }));
      } catch (e) {
        print(e);
      }
    } else {
      print("pura bhar na");
    }
  }

  @override
  Widget build(BuildContext context) {
    var ima = (_imagefile == null
        ? NetworkImage("https://freesvg.org/img/abstract-user-flat-4.png")
        : FileImage(File(_imagefile!.path))) as ImageProvider;
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
          title: Text(
        " Update Profile ",
        style: TextStyle(color: Colors.red),
      )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Stack(
                children: [
                  Center(
                    child: Stack(children: [
                      SizedBox(
                        height: 40,
                      ),
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: ima,
                      )
                    ]),
                  ),
                  Positioned(
                      bottom: -0.5,
                      left: 200,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.green,
                        ),
                        child: IconButton(
                            onPressed: () {
                              print("Change");
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => bottomSheet()));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            )),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _fname,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Full-Name",
                    label: Text("Enter name"),
                    prefixIcon: Icon(Icons.drive_file_rename_outline_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                validator: (value) {
                  if (!GetUtils.isLengthGreaterOrEqual(value, 6)) {
                    return "Enter Full name";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 30,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _email,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Email",
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                validator: (value) {
                  if (!GetUtils.isEmail(value!)) {
                    return "Invalid -Email";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 30,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(),
                obscureText: true,
                controller: _pass,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                validator: (value) {
                  if (!GetUtils.isLengthGreaterOrEqual(value, 6)) {
                    return "Min 6 - Chars";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 30,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(),
                obscureText: true,
                // controller: _pass,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Confirm-Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                validator: (value) {
                  if (!GetUtils.isLengthGreaterOrEqual(value, 6)) {
                    return "Min 6 - Chars";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: street,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "Street-Name",
                  prefixIcon: Icon(Icons.maps_home_work),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: landmark,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "Landmark/nearby",
                  prefixIcon: Icon(Icons.maps_home_work),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: pincode,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Pincode",
                    prefixIcon: Icon(Icons.person_pin_circle_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                validator: (value) {
                  if (!GetUtils.isLengthGreaterOrEqual(value, 6)) {
                    return "Enter correct-pincode";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(), elevation: 10),
              onPressed: updateRecord,
              child: Text(
                "SAVE",
                style: TextStyle(
                    fontSize: 16, letterSpacing: 2.2, color: Colors.black),
              ),
            )
          ]),
        ),
      )),
    );
  }
}

// #############################################################################################################################/////////#

// +++++++++++++++++++++++++++++++
class UserProfileSettings extends StatefulWidget {
  @override
  _UserProfileSettingsState createState() => _UserProfileSettingsState();
}

class _UserProfileSettingsState extends State<UserProfileSettings> {
  bool _isDarkModeEnabled = false;
  bool isDarkMode = false;
  List<String> _selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Profile Settings'),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Appearance Settings',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SwitchListTile(
                title: Text('Dark Mode'),
                value: _isDarkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _isDarkModeEnabled = value;
                    // Code to toggle dark mode in the app
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Interests',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                children: [
                  _interestChip('Daily-shopping'),
                  _interestChip('weekly-shopping'),
                  _interestChip('Fast-Dilivery'),
                  _interestChip('Fresh-Food'),
                  _interestChip('Vegan'),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  // Code to save user profile settings
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _interestChip(String label) {
    final isSelected = _selectedInterests.contains(label);
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (value) {
        setState(() {
          if (isSelected) {
            _selectedInterests.remove(label);
          } else {
            _selectedInterests.add(label);
          }
        });
      },
    );
  }
}

//############################################################

class OrderTrackingPage extends StatefulWidget {
  @override
  _OrderTrackingPageState createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  // Initialize some example order data
  String _orderId = "11046";
  String _orderStatus = "Pending";
  String _estimatedDeliveryDate = "March 20, 2023";
  String _Mode = "Online";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Tracking"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Order ID: $_orderId",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              "Amount-Status: $_orderStatus",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            SizedBox(height: 16),
            Text(
              "Mode: $_Mode",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 28),
            Text(
              "Estimated Delivery Date: $_estimatedDeliveryDate",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Perform some action when the user clicks the button
              },
              child: Text("Refresh"),
            ),
          ],
        ),
      ),
    );
  }
}
// ###################################################################

class RicePage extends StatelessWidget {
  final List<Map<String, dynamic>> _riceTypes = [
    {
      'name': 'Jasmine Rice',
      'price': 80,
      'image': 'jasmine.png',
    },
    {
      'name': 'Basmati Rice',
      'price': 72,
      'image': 'basmati_rice.png',
    },
    {
      'name': 'Brown Rice',
      'price': 59,
      'image': 'brown_rice.png',
    },
    {
      'name': 'Wild Rice',
      'price': 62,
      'image': 'wild_rice.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Types of Rice'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _riceTypes.length,
          itemBuilder: (BuildContext context, int index) {
            final Map<String, dynamic> riceType = _riceTypes[index];
            var c;
            return Card(
              child: ListTile(
                  leading: Image.network(
                    'https://th.bing.com/th/id/OIP.i9eT_LGA08S5y7quE7oJpAHaE7?pid=ImgDet&rs=1',
                    width: 40,
                    height: 40,
                  ),
                  title: Text(riceType['name']),
                  subtitle: Text('₹${riceType['price'].toStringAsFixed(2)}'),
                  trailing: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.redAccent),
                        child: IconButton(
                          onPressed: () => c.decre(),
                          icon: Icon(Icons.remove, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Obx(() => Text("${c.o.toString()}")),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.redAccent),
                        child: IconButton(
                          onPressed: () => c.incre(),
                          icon: Icon(Icons.add, color: Colors.white),
                        ),
                      )
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
