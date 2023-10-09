import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_now_admin/splash_screnn.dart';
import 'package:image_picker/image_picker.dart';

import 'home_page.dart';

class AddCarView extends StatefulWidget {
  const AddCarView({super.key});

  @override
  State<AddCarView> createState() => _AddCarViewState();
}

class _AddCarViewState extends State<AddCarView> {
  bool img1 = false;
  bool img2 = false;
  bool img3 = false;
  bool img4 = false;
  final picker = ImagePicker();
  String ImagePath1 = "";
  File? Image1;
  String ImagePath2 = "";
  File? Image2;
  String ImagePath3 = "";
  File? Image3;
  String ImagePath4 = "";
  File? Image4;
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

  void getImage1() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // ProfilePhoto = pickedFile as String?;

    if (pickedFile != null) {
      setState(() {
        Image1 = File(pickedFile.path);
        ImagePath1 = pickedFile.path;
        img1 = true;
      });
    }
  }

  void getImage2() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // ProfilePhoto = pickedFile as String?;

    if (pickedFile != null) {
      setState(() {
        Image2 = File(pickedFile.path);
        ImagePath2 = pickedFile.path;
        img2 = true;
      });
    }
  }

  void getImage3() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // ProfilePhoto = pickedFile as String?;

    if (pickedFile != null) {
      setState(() {
        Image3 = File(pickedFile.path);
        ImagePath3 = pickedFile.path;
        img3 = true;
      });
    }
  }

  void getImage4() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // ProfilePhoto = pickedFile as String?;

    if (pickedFile != null) {
      setState(() {
        Image4 = File(pickedFile.path);
        ImagePath4 = pickedFile.path;
        img4 = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFADD),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(child: Text("Main Image")),
            Container(
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFF8A400)),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(30),
                child: img1
                    ? Image.file(
                        File(ImagePath1!),
                        fit: BoxFit.contain,
                      )
                    : IconButton(
                        onPressed: () {
                          getImage1();
                        },
                        icon: const Icon(CupertinoIcons.add_circled))),

            const Center(child: Text("Sub Images")),
            Container(
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFF8A400)),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: img2
                    ? Image.file(
                        File(ImagePath2!),
                        fit: BoxFit.contain,
                      )
                    : IconButton(
                        onPressed: () {
                          getImage2();
                        },
                        icon: const Icon(CupertinoIcons.add_circled))),
            Container(
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFF8A400)),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: img3
                    ? Image.file(
                        File(ImagePath3!),
                        fit: BoxFit.contain,
                      )
                    : IconButton(
                        onPressed: () {
                          getImage3();
                        },
                        icon: const Icon(CupertinoIcons.add_circled))),
            Container(
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFF8A400)),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: img4
                    ? Image.file(
                        File(ImagePath4!),
                        fit: BoxFit.contain,
                      )
                    : IconButton(
                        onPressed: () {
                          getImage4();
                        },
                        icon: const Icon(CupertinoIcons.add_circled))),
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
                  child: const Text("SEND DATA")),
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
    String CarStatus = carStatus.text.toString().trim();
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
    List<int> img1 = File(ImagePath1).readAsBytesSync();
    String Photo1 = base64Encode(img1);
    List<int> img2 = File(ImagePath2).readAsBytesSync();
    String Photo2 = base64Encode(img2);
    List<int> img3 = File(ImagePath3).readAsBytesSync();
    String Photo3 = base64Encode(img3);
    List<int> img4 = File(ImagePath4).readAsBytesSync();
    String Photo4 = base64Encode(img4);

    Map<String, String> CarData = {
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
      'Main_Image': Photo1,
      'Sub_Image1': Photo2,
      'Sub_Image2': Photo3,
      'Sub_Image3': Photo4
    };

    var url =
        Uri.parse('https://newappofflutter.000webhostapp.com/addCarData.php');

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
