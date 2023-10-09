import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_now_admin/splash_screnn.dart';
import 'package:image_picker/image_picker.dart';

import 'home_page.dart';

class UpdateCarView extends StatefulWidget {

  Productdata productdata;


  UpdateCarView(this.productdata);

  @override
  State<UpdateCarView> createState() => _UpdateCarViewState();
}

class _UpdateCarViewState extends State<UpdateCarView> {

  TextEditingController carName = TextEditingController();
  TextEditingController modelName = TextEditingController();
  TextEditingController carStatus = TextEditingController();
  TextEditingController carDesc = TextEditingController();
  TextEditingController carCat = TextEditingController();
  TextEditingController carCondi = TextEditingController();
  TextEditingController carFcondi = TextEditingController();
  TextEditingController carSeating = TextEditingController();
  TextEditingController carEngine = TextEditingController();
  TextEditingController carAvg = TextEditingController();
  TextEditingController carRentType = TextEditingController();
  TextEditingController carRentPrice = TextEditingController();
  TextEditingController carDocuments = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      carName.text=widget.productdata.name??"";
      modelName.text=widget.productdata.model??"";
      carStatus.text=widget.productdata.status??"";
      carDesc.text=widget.productdata.description??"";
      carCat.text=widget.productdata.catagory??"";
      carCondi.text=widget.productdata.condi??"";
      carFcondi.text=widget.productdata.fcondition??"";
      carSeating.text=widget.productdata.seat??"";
      carEngine.text=widget.productdata.engine??"";
      carAvg.text=widget.productdata.averg??"";
      carRentType.text=widget.productdata.renttype??"";
      carRentPrice.text=widget.productdata.rentprice??"";
      carDocuments.text=widget.productdata.documents??"";
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFADD),
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(child: Text("Car Detail's")),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 450,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: carName,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Car Name...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.car_crash_outlined)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 450,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: modelName,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Car Model Number...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.confirmation_number_outlined)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 450,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: carStatus,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Car Status...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.event_available)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 450,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: carDesc,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Car Description...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.description_outlined)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 450,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: carCat,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Car Category...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.category)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 450,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: carCondi,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Car Condition...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.repeat_one)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 450,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: carFcondi,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Car Fuel Condition...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.hourglass_full_sharp)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 450,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: carSeating,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Car Seating Capacity...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.event_seat)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 450,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: carEngine,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Car Engine Capacity...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.account_tree_outlined)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 450,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: carAvg,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Car Average...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.align_vertical_bottom_outlined)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 450,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: carRentType,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Car Rent type...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.type_specimen_outlined)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 450,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: carRentPrice,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Car Rent Price...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.currency_rupee_outlined)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 450,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: carDocuments,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Car Rent Documents...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.document_scanner_rounded)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    showDialog(context: context, builder: (context) {
                      return Center(child: CircularProgressIndicator(),);
                    },);
                    sendData().whenComplete(() =>   getdData().whenComplete(() {
                      Get.back();

                      setState(() {
                        HomePage.btmIndex=0;

                        Get.forceAppUpdate();
                        Get.back();
                        Get.back();
                      });
                    },));
                    //Get.offAll(()=>const HomePage());
                  },
                  style: ButtonStyle(
                      fixedSize:
                      const MaterialStatePropertyAll(Size.fromWidth(200)),
                      backgroundColor:
                      const MaterialStatePropertyAll(Color(0xFFF8A400)),
                      shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  child: const Text("UPDATE DATA")),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  Future<void> sendData() async {
    String CarName = carName.text.toString();
    String CarModel = modelName.text.toString();
    String CarStatus = carStatus.text.toString();
    String CarDesc = carDesc.text.toString();
    String CarCat = carCat.text.toString();
    String CarCondition = carCondi.text.toString();
    String CarFuealCondition = carFcondi.text.toString();
    String CarSeating = carSeating.text.toString();
    String CarEngine = carEngine.text.toString();
    String CarAvarege = carAvg.text.toString();
    String CarRentType = carRentType.text.toString();
    String CarRentPrice = carRentPrice.text.toString();
    String CarDocuments = carDocuments.text.toString();


    Map<String, String> CarData = {
      'Car_Id': widget.productdata.id??"",
      'Car_Name': CarName,
      'Car_Model': CarModel,
      'Car_Status': CarStatus,
      'Car_Description': CarDesc,
      'Car_Catagory': CarCat,
      'Car_Condition': CarCondition,
      'Car_Fuel_Condition': CarFuealCondition,
      'Car_Seating_Capacity': CarSeating,
      'Car_Engine_Type': CarEngine,
      'Car_Avarage': CarAvarege,
      'Car_Rent_Type': CarRentType,
      'Car_Rent_Price': CarRentPrice,
      'Car_Documents': CarDocuments,
    };

    var url =
    Uri.parse('https://newappofflutter.000webhostapp.com/updateCar.php');

    var response = await http.post(url, body: CarData);
    print(response.body);
    //   if (response.statusCode == 200) {
    //     var responseBody = jsonDecode(response.body);
    //     // setState(() {
    //     //   userData=UserData.fromJson(responseBody);
    //     // });
    //
    // }
    getdDatacat1();
    getdDatacat2();
    getdDatacat3();
    getdDatacat4();
  }
  Future<void> getdData() async {
    var url = Uri.parse(
        'https://newappofflutter.000webhostapp.com/view_car.php');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      setState(() {
        SplashScreen.car=CarData.fromJson(responseBody);
        SplashScreen.car.productdata!.sort((a, b) {
          return a.id!.compareTo(b.id!);
        },);
      });

    }
    getdDatacat1();
    getdDatacat2();
    getdDatacat3();
    getdDatacat4();
  }
  getdDatacat1() async {
    var url = Uri.parse(
        'https://newappofflutter.000webhostapp.com/view_car_cat.php');

    var response = await http.post(url,body: {'cat':'NEW'});
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      setState(() {
        SplashScreen.carNew=CarData.fromJson(responseBody);
        SplashScreen.carNew.productdata!.sort((a, b) {
          return a.id!.compareTo(b.id!);
        },);
      });
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Server Connection Error"),)));
    }

  }
  getdDatacat2() async {
    var url = Uri.parse(
        'https://newappofflutter.000webhostapp.com/view_car_cat.php');

    var response = await http.post(url,body: {'cat':'OLD'});
    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        setState(() {
          SplashScreen.carOld=CarData.fromJson(responseBody);
          SplashScreen.carOld.productdata!.sort((a, b) {
            return a.id!.compareTo(b.id!);
          },);
        });
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Server Connection Error"),)));
      }

    }}
  getdDatacat3() async {
    var url = Uri.parse(
        'https://newappofflutter.000webhostapp.com/view_car_cat.php');

    var response = await http.post(url,body: {'cat':'SPORT'});
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      setState(() {
        SplashScreen.carSport=CarData.fromJson(responseBody);
        SplashScreen.carSport.productdata!.sort((a, b) {
          return a.id!.compareTo(b.id!);
        },);
      });
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Server Connection Error"),)));
    }


  }
  getdDatacat4() async {
    var url = Uri.parse(
        'https://newappofflutter.000webhostapp.com/view_car_cat.php');

    var response = await http.post(url,body: {'cat':'FAMILY'});
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      setState(() {
        SplashScreen.carFamily=CarData.fromJson(responseBody);
        SplashScreen.carFamily.productdata!.sort((a, b) {
          return a.id!.compareTo(b.id!);
        },);
      });
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Server Connection Error"),)));
    }
  }
}
