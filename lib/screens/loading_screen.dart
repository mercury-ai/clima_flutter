import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    getLocation();
  }

  void getData() async{
    String data;
    http.Response  response = await http.get('http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=3540724434b2f81f3f79da0abdaa0491');
    if(response.statusCode==200){
      data = response.body;
      print(response.body);
    }else{
      print(response.statusCode);
    }
  }

  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: Text(
          'Loading Screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
