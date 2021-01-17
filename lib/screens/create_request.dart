import 'package:HomelessAlone/screens/find_request.dart';
import 'package:HomelessAlone/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

class CreateScreen extends StatefulWidget {
  static const routeName = '/create';
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  var _food = false;
  var _house = false;
  var _other = false;


  FirebaseAuth auth = FirebaseAuth.instance;
  void inputData() async {
    final FirebaseUser user = await auth.currentUser();
    final _currentUUID = user.uid;
    // here you write the codes to input the data into firestore
  }

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  final itemController = TextEditingController();
  Position _currentPosition;
  String _currentAddress;
  String _currentUUID;
  double _lat;
  double _long;
  _getAddressFromLatLng() async {
    print('ih');
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];
      print(place);
      print(
          "${place.name} ${place.thoroughfare}, ${place.locality}, ${place.administrativeArea}, ${place.country}, ${place.postalCode}");
      _currentAddress =
          "${place.name} ${place.thoroughfare}, ${place.locality}, ${place.administrativeArea}, ${place.country}, ${place.postalCode}";
    } catch (e) {
      print(e);
    }
  }

  List<Widget> _buildInputSection(
    BuildContext ctx,
    String label,
    String textFieldHint,
    IconData icon,
  ) {
    return [
      Container(
        padding: EdgeInsets.only(
          left: 30,
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(ctx).primaryColor,
            fontSize: 18,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        child: TextField(
          controller: itemController,
          style: TextStyle(
            color: Theme.of(ctx).accentColor,
          ),
          decoration: InputDecoration(
            labelText: textFieldHint,
            labelStyle: TextStyle(color: Theme.of(ctx).primaryColor),
            prefixIcon: Icon(
              icon,
              color: Theme.of(ctx).primaryColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(ctx).primaryColor,
                width: 3,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(ctx).accentColor,
              ),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var _foodColor = Theme.of(context).primaryColor;
    var _houseColor = Theme.of(context).primaryColor;
    var _otherColor = Theme.of(context).primaryColor;

    return Scaffold(
        drawer: DrawerSection(),
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.menu,
          //     color: Theme.of(context).primaryColor,
          //     size: 30,
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).pushNamed(
          //       FindRequest.routeName,
          //     );
          //   },
          // ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Builder(builder: (BuildContext context1) {
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Create Request',
                  style: TextStyle(
                    fontFamily: 'Source Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ..._buildInputSection(
                context,
                'Item Requested',
                'Item',
                Icons.gesture,
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Category',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.dinner_dining,
                            color: _foodColor,
                          ),
                          iconSize: 50,
                          onPressed: () {
                            if (_food == true) {
                              return;
                            }
                            if (_house == true) {
                              setState(() {
                                _food = true;
                                _house = false;
                                _other = false;

                                _foodColor = Theme.of(context).accentColor;
                                _houseColor = Theme.of(context).primaryColor;
                              });
                            }
                            if (_other == true) {
                              setState(() {
                                _food = true;
                                _house = false;
                                _other = false;

                                _foodColor = Theme.of(context).accentColor;
                                _otherColor = Theme.of(context).primaryColor;
                              });
                            }
                            if (_food == false &&
                                _house == false &&
                                _other == false) {
                              setState(() {
                                _food = true;
                                _house = false;
                                _other = false;

                                _foodColor = Theme.of(context).accentColor;
                              });
                              print(_food);
                              print(_foodColor);
                            }
                          },
                        ),
                        Text(
                          'Food',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.house,
                            color: _houseColor,
                          ),
                          iconSize: 50,
                          onPressed: () {
                            if (_house == true) {
                              return;
                            }
                            if (_food == true) {
                              setState(() {
                                _house = true;
                                _food = false;
                                _other = false;

                                _houseColor = Theme.of(context).accentColor;
                                _foodColor = Theme.of(context).primaryColor;
                              });
                            }
                            if (_other == true) {
                              setState(() {
                                _house = true;
                                _food = false;
                                _other = false;

                                _houseColor = Theme.of(context).accentColor;
                                _otherColor = Theme.of(context).primaryColor;
                              });
                            }
                            if (_food == false &&
                                _house == false &&
                                _other == false) {
                              setState(() {
                                _house = true;
                                _food = false;
                                _other = false;

                                _houseColor = Theme.of(context).accentColor;
                              });
                              print(_food);
                              print(_foodColor);
                            }
                          },
                        ),
                        Text(
                          'Housing',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.blur_on,
                            color: _otherColor,
                          ),
                          iconSize: 50,
                          onPressed: () {
                            if (_other == true) {
                              return;
                            }
                            if (_food == true) {
                              setState(() {
                                _other = true;
                                _food = false;
                                _house = false;

                                _otherColor = Theme.of(context).accentColor;
                                _foodColor = Theme.of(context).primaryColor;
                              });
                            }
                            if (_house == true) {
                              setState(() {
                                _other = true;
                                _food = false;
                                _house = false;

                                _otherColor = Theme.of(context).accentColor;
                                _houseColor = Theme.of(context).primaryColor;
                              });
                            }
                            if (_food == false &&
                                _house == false &&
                                _other == false) {
                              setState(() {
                                _other = true;
                                _food = false;
                                _house = false;

                                _otherColor = Theme.of(context).accentColor;
                              });
                              print(_food);
                              print(_foodColor);
                            }
                          },
                        ),
                        Text(
                          'Other',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Location',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.location_on,
                    color: Theme.of(context).primaryColor,
                    size: 50,
                  ),
                  onPressed: () {
                    // Navigator.of(context).pushNamed(
                    //   FindRequest.routeName,
                    // );

                    inputData();

                    final Geolocator geolocator = Geolocator()
                      ..forceAndroidLocationManager;

                    geolocator
                        .getCurrentPosition(
                            desiredAccuracy: LocationAccuracy.best)
                        .then((Position position) {
                      _currentPosition = position;
                      _lat = position.latitude;
                      _long = position.longitude;
                      print(_currentPosition);
                      _getAddressFromLatLng();
                      print(_currentAddress);
                    }).catchError((e) {
                      print(e);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  

                  Firestore.instance.collection('requests').add(
                    {
                      'item': itemController.text,
                      'food': _food,
                      'house': _house,
                      'other': _other,
                      'date': DateFormat.yMd().format(DateTime.now()),
                      'time': DateFormat.jm().format(DateTime.now()),
                      'address': _currentAddress,
                      'lat': _lat,
                      'long': _long,
                      'uid': _currentUUID,
                    },
                  );
                  Scaffold.of(context1).showSnackBar(SnackBar(
                    content: Text(
                      'Request has been added',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    elevation: 5,
                    backgroundColor: Color.fromRGBO(92, 83, 70, 1),
                  ));
                },
                child: Container(
                  color: Theme.of(context).accentColor,
                  height: 82,
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Create',
                    style: TextStyle(
                      color: Color.fromRGBO(92, 83, 70, 1),
                      fontSize: 30,
                    ),
                  ),
                ),
              )
            ],
          );
        }));
  }
}
