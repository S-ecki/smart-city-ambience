import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:image_picker/image_picker.dart';
import 'guide.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  
  File _image;
  var isVisible = true;
  var isVisible2 = true;
  var isVisible3 = true;
  var isVisible4 = true;
  var isVisible5 = true;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    // ! new
    var provider = context.watch<User>();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            profilePicture(), //Profilbild
            SizedBox(height: 20),
            nameTextfield(), //Name
            SizedBox(height: 20),
            DateTextfield(), //Geburtsdatum
            SizedBox(height: 20),
            mailTextfield(provider), //E-Mail
            SizedBox(height: 20),
            numberTextfield(), //Telefonnummer
            SizedBox(height: 20),
            Container(
              alignment: Alignment.bottomLeft,
              child: ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Profildaten gespeichert."),
                    ),
                  );

                  
                },
                child: Text("Speichern"),
                    
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.of(context).pushNamed(SmortRoutes.loginScreen);
        },
      ),
    );
  }

  _imgFromCamera() async {
    //Funktion für Bilder importieren von Kamera
    File image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    ////Funktion für Bilder importieren von Gallerie
    File image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      _image = image;
    });
  }

  Widget profilePicture() {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: <Widget>[
          Container(
              child: CircleAvatar(
                backgroundImage: _image ==
                        null //wenn kein Bild aus der Gallerie oder aus Kamera -> Standardbild
                    ? AssetImage("assets/images/test_image.jpg")
                    : FileImage((File(_image.path))),
              ),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              )),
          Positioned(
              bottom: 0,
              right: 110,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            height: 110,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                            child: Column(children: <Widget>[
                              Text(
                                "Foto auswählen",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 21,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  TextButton.icon(
                                    icon: Icon(
                                      Icons.camera,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      _imgFromCamera();
                                    },
                                    label: Text(
                                      "Kamera",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ),
                                  TextButton.icon(
                                    icon: Icon(
                                      Icons.image,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      _imgFromGallery();
                                    },
                                    label: Text(
                                      "Gallerie",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ]));
                      });
                },
                child: Icon(
                  Icons.camera_alt_sharp,
                  size: 30,
                ),
              ))
        ],
      ),
    );
  }

  Widget nameTextfield() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide()),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          )),
          prefixIcon: Icon(
            Icons.person,
            color: Theme.of(context).primaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            color: isVisible ? Colors.grey : Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
          ),
          labelText: "Name"),
    );
  }

  Widget mailTextfield(User provider) {
    return TextFormField(
      enabled: false,
      decoration: InputDecoration(
        hintText: provider?.email ?? "", // empty string when called on null
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.yellow,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
          width: 2,
        )),
        prefixIcon: Icon(Icons.mail_outline, color: Theme.of(context).primaryColor),
        suffixIcon: IconButton(
          icon: Icon(Icons.visibility),
          color: isVisible2 ? Colors.grey : Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              isVisible2 = !isVisible2;
            });
          },
        ),
        labelText: "E-Mail",
      ),
    );
  }

  Widget DateTextfield() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.teal,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          )),
          prefixIcon: Icon(
            Icons.calendar_today,
            color: Theme.of(context).primaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            color: isVisible4 ? Colors.grey : Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                isVisible4 = !isVisible4;
              });
            },
          ),
          labelText: "Geburtsdatum",
          hintText: " DD-MM-YYYY"),
    );
  }

  Widget numberTextfield() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.teal,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          )),
          prefixIcon: Icon(
            Icons.phone,
            color: Theme.of(context).primaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility,
                color: isVisible5 ? Colors.grey : Theme.of(context).primaryColor),
            onPressed: () {
              setState(() {
                isVisible5 = !isVisible5;
              });
            },
          ),
          labelText: "Nummer",
          hintText: " +436608754333"),
    );
  }
}
