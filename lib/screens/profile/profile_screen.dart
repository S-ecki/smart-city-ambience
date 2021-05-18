import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/redux/reactionsState.actions.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_city_ambience/types/enhancedUser.dart';
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

    return StoreConnector<ReactionsState, EnhancedUser>(
      converter: (store) => store.state.user,
      builder: (context, user) {
        final TextEditingController nameController =
            TextEditingController(text: user.name);
        final TextEditingController birthController =
            TextEditingController(text: user.birthDate);
        final TextEditingController telNrController =
            TextEditingController(text: user.telNr);

        return Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamed(SmortRoutes.loginScreen);
                },
              ),
            ],
            title: Text("Profil"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(
              children: <Widget>[
                profilePicture(), //Profilbild
                SizedBox(height: 20),
                nameTextfield(nameController), //Name
                SizedBox(height: 20),
                DateTextfield(birthController), //Geburtsdatum
                SizedBox(height: 20),
                mailTextfield(provider), //E-Mail
                SizedBox(height: 20),
                numberTextfield(telNrController), //Telefonnummer
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Daten auf letzen Stand zurückgesetzt."),
                            ),
                          );
                        },
                        child: Text("Zurücksetzen")),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: ElevatedButton(
                        style: ButtonStyle(),
                        onPressed: () {
                          StoreProvider.of<ReactionsState>(context).dispatch(
                            UpdateUserInformation(
                              newUser: EnhancedUser(
                                  name: nameController.text,
                                  birthDate: birthController.text,
                                  email: provider.email,
                                  telNr: telNrController.text),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Profildaten gespeichert."),
                            ),
                          );
                        },
                        child: Text("Speichern"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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
                    ? AssetImage("assets/images/person.jpg")
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontSize: 20),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(fontSize: 20),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(fontSize: 20),
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

  Widget nameTextfield(TextEditingController controller) {
    print(controller);

    return TextFormField(
      controller: controller,
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
          icon: isVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          color: isVisible ? Theme.of(context).primaryColor : Colors.grey,
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
        ),
        labelText: "Name",
      ),
    );
  }

  Widget mailTextfield(User provider) {
    return TextFormField(
      enabled: false,
      initialValue: provider.email ?? "",
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.yellow,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
          width: 2,
        )),
        prefixIcon:
            Icon(Icons.mail_outline, color: Theme.of(context).primaryColor),
        suffixIcon: IconButton(
          icon:
              isVisible2 ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          color: isVisible2 ? Theme.of(context).primaryColor : Colors.grey,
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

  Widget DateTextfield(TextEditingController controller) {
    print(controller);
    return TextFormField(
      controller: controller,
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
            icon: isVisible4
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
            color: isVisible4 ? Theme.of(context).primaryColor : Colors.grey,
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

  Widget numberTextfield(TextEditingController controller) {
    return TextFormField(
      controller: controller,
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
          icon:
              isVisible5 ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          color: isVisible5 ? Theme.of(context).primaryColor : Colors.grey,
          onPressed: () {
            setState(() {
              isVisible5 = !isVisible5;
            });
          },
        ),
        labelText: "Nummer",
      ),
    );
  }
}
