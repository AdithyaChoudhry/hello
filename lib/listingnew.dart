
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:tute_me/homepage.dart';
import 'package:tute_me/profile.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'models.dart';

class Item{
  Item(this.title);
  String title;
  bool selected = false;
}

var techstackjson = [
  {
    'name': 'class 1  '
  },
  {
    'name': 'class 2  '
  },
  {
    'name': 'class 3  '
  },
  {
    'name': 'class 4  '
  },
  {
    'name': 'class 5  '
  },
  {
    'name': 'class 6  '
  },
  {
    'name': 'class 7  '
  },
  {
    'name': 'class 8  '
  },
  {
    'name': 'class 9  '
  },
  {
    'name': 'class 10  '
  },
  {
    'name': 'class 11  '
  },
  {
    'name': 'class 12  '
  },

];




class Listing extends StatefulWidget {


  const Listing({Key? key}) : super(key: key);

  @override
  _ListingState createState() => _ListingState();
}


class _ListingState extends State<Listing> {
  var indexs = [];
  int? selectedIndex;

  var futures;

  bool isSelected(index, List indexs) {
    if (indexs.contains(index)) {
      return true;
    }
    return false;
  }
  Future<List<TechStacks>> getTeckstack() async {
    // Future.delayed(const Duration(milliseconds: 1500), () {
    //   // deleayed code here

    // });
    List<TechStacks> techStacks =
    techstackjson.map((e) => TechStacks.fromJson(e)).toList();

    return techStacks;
  }


  @override
  void initState() {
    super.initState();
    futures = getTeckstack();
  }

  String location = 'Null, Press Button';
  String Address = 'search';

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place
        .postalCode}, ${place.country}';
    setState(() {});}

    @override
    Widget build(BuildContext context) {
      var dropdownValue;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Your details", style: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),),
          leading: Builder(
            builder: (context) =>
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded, color: Colors.black,),
                  onPressed: () => Navigator.pop(context),
                ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  Align(
                    alignment: Alignment.centerLeft,
                    //padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05,top:MediaQuery.of(context).size.height*0.3),
                    child: Text("First Name",
                      style: TextStyle(color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  //SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      hintStyle: TextStyle(fontSize: 14),
                      //border: UnderlineInputBorder(
                      //borderRadius: BorderRadius.circular(16),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    style: TextStyle(fontSize: 14,),
                    //maxLines: 3,
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  Align(
                    alignment: Alignment.centerLeft,
                    //padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05,top:MediaQuery.of(context).size.height*0.3),
                    child: Text("Last Name",
                      style: TextStyle(color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  //SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your Name",
                      hintStyle: TextStyle(fontSize: 14),
                      //border: UnderlineInputBorder(
                      //borderRadius: BorderRadius.circular(16),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    style: TextStyle(fontSize: 14,),
                    //maxLines: 3,
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  Align(
                    alignment: Alignment.centerLeft,
                    //padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05,top:MediaQuery.of(context).size.height*0.3),
                    child: Text("Mode",
                      style: TextStyle(color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  //SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  DropdownButtonFormField(
                    dropdownColor: Colors.white,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded, color: Colors.red,),
                    hint: Text("Choose a Mode"),
                    items: [
                      "Online",
                      "Offline",

                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                          style: TextStyle(fontSize: 14, color: Colors.black),),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      print(newValue);

                    },
                    decoration: const InputDecoration(
                      enabled: true,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    //padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05,top:MediaQuery.of(context).size.height*0.3),
                    child: Text("Location",
                      style: TextStyle(color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Location",
                      hintStyle: TextStyle(fontSize: 14),
                      //border: UnderlineInputBorder(
                      //borderRadius: BorderRadius.circular(16),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    style: TextStyle(fontSize: 14,),
                    //maxLines: 3,
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),






                  Text('Coordinates Points',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text(location,style: TextStyle(color: Colors.black,fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('ADDRESS',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text('${Address}'),
                  ElevatedButton(onPressed: () async {
                    Position position = await _determinePosition();

                    location =
                    'Lat: ${position.latitude} , Long: ${position.longitude}';

                    setState(() {

                    });
                    GetAddressFromLatLong(position);
                  }, child: Text('Get Location')
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    //padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05,top:MediaQuery.of(context).size.height*0.3),
                    child: Text("Classes",
                      style: TextStyle(color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  TextField(
                    decoration: InputDecoration(
                      hintText: "Preffered classes",
                      hintStyle: TextStyle(fontSize: 14),
                      //border: UnderlineInputBorder(
                      //borderRadius: BorderRadius.circular(16),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    style: TextStyle(fontSize: 14,),
                    //maxLines: 3,
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Select the Class you prefer\n   ',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),

                  SizedBox(
                      height: 250,
                      child: FutureBuilder<List<TechStacks>>(
                        future: futures, // async work
                        builder: (BuildContext context,
                            AsyncSnapshot<List<TechStacks>> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const Text('Loading....');
                            default:
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return GridView.builder(
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 1,
                                      // mainAxisExtent: 2,
                                      childAspectRatio: 2.0,
                                      crossAxisSpacing: 7,
                                      crossAxisCount: 3),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, int index) => InputChip(
                                    backgroundColor: isSelected(index, indexs)
                                        ? Theme.of(context).primaryColor
                                        : const Color(0xFF3E5561),
                                    avatar: isSelected(index, indexs)
                                        ? const Icon(
                                      Icons.check_box_rounded,
                                      size: 20,
                                    )
                                        : const Icon(Icons.add),
                                    label: Text(
                                      '${snapshot.data![index].name!},',
                                      style: isSelected(index, indexs)
                                          ? const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)
                                          : TextStyle(
                                          fontSize: 20,
                                          color: Colors.blueGrey[100],
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onSelected: (bool value) {
                                      selectedIndex = index;
                                      setState(() {
                                        (indexs.contains(index)
                                            ? indexs.remove(index)
                                            : indexs.add(index));
                                      });
                                    },
                                  ),
                                );
                              }
                          }
                        },
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Add',
                        style: TextStyle(fontSize: 20,color: Colors.black),
                      ))

]
          ),
        ),
        )     );
    }
  }


