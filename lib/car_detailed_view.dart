import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now_admin/splash_screnn.dart';
import 'package:go_now_admin/add_updateCar.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';

class CarView extends StatefulWidget {
  Productdata productdata;

  CarView(this.productdata, {super.key});

  @override
  State<CarView> createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFADD),
      appBar: AppBar(
        title: Text("${widget.productdata.name}",
            style: const TextStyle(color: Color(0xFF000628))),
        centerTitle: true,
        backgroundColor: const Color(0xFFF8A400),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(CupertinoIcons.back)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF8A400)),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                CarouselSlider(
                  items: List.generate(
                    4,
                    (index) =>Image.network(index==0?"https://newappofflutter.000webhostapp.com/${widget.productdata.img1}":index==1?"https://newappofflutter.000webhostapp.com/${widget.productdata.img2}":index==2?"https://newappofflutter.000webhostapp.com/${widget.productdata.img3}":"https://newappofflutter.000webhostapp.com/${widget.productdata.img4}", repeat: ImageRepeat.noRepeat,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                              color: Color(0xFFF8A400),
                              strokeWidth: 1,
                              value:
                              loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null),
                        );
                      },).marginAll(32),
                  ).toList(),
                  options: CarouselOptions(
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        imageIndex = index;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      height: 6,
                      width: 6,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (index == imageIndex)
                              ? const Color(0xFFF8A400)
                              : const Color(0xFF16B877)),
                    );
                  }),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.productdata.name}",
                    style: const TextStyle(
                        color: Color(0xFF000628),
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 5,),
                Text("${widget.productdata.model}",
                    style: const TextStyle(
                        color: Color(0xFF000628))),
                const SizedBox(height: 30,),
                 Text("Status.. : ${widget.productdata.status}",
                    style: const TextStyle(
                        color: Color(0xFF000628),fontSize: 18,fontWeight: FontWeight.w500)),
                const SizedBox(height: 30,),
                const Text("ABOUT THIS CAR...",
                    style: TextStyle(
                        color: Color(0xFF000628),fontSize: 18,fontWeight: FontWeight.w500)),
                const SizedBox(height: 10,),
                 Text("${widget.productdata.description}",
                    style: TextStyle(
                        color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w300)),
                const SizedBox(height: 30,),
                const Text("KEY FEATURES...",
                    style: TextStyle(
                        color: Color(0xFF000628),fontSize: 18,fontWeight: FontWeight.w500)),
                const SizedBox(height: 10,),
                Text("Category : ${widget.productdata.catagory}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Condition :${widget.productdata.condi}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Fuel Type : ${widget.productdata.fcondition}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Seating Capacity : ${widget.productdata.seat}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Engine Capacity : ${widget.productdata.engine}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Average km : ${widget.productdata.averg}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Rent Type : ${widget.productdata.renttype}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Rent Price : ${widget.productdata.rentprice}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Required Documents : ${widget.productdata.documents}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(()=>UpdateCarView(widget.productdata),transition: Transition.circularReveal,duration: const Duration(milliseconds: 700),);
                      },
                      style: ButtonStyle(
                          fixedSize: const MaterialStatePropertyAll(
                              Size.fromWidth(100)),
                          backgroundColor:
                          const MaterialStatePropertyAll(
                              Color(0xFFFFFADD)),
                          shape: MaterialStatePropertyAll(
                              ContinuousRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      20)))),
                      child: const Text("Update",
                          style: TextStyle(
                              color: Color(0xFFF8A400),
                              fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(context: context, builder: (context) {
                          return Center(child: CircularProgressIndicator(),);
                        },);
                        onDelete().whenComplete(() =>   getdData().whenComplete(() {
                          Get.back();
                          setState(() {
                            Get.back();
                            HomePage.btmIndex=0;
                            Get.forceAppUpdate();
                          });
                        },));
                        //Get.offAll(()=>const HomePage());
                      },
                      style: ButtonStyle(
                          fixedSize: const MaterialStatePropertyAll(
                              Size.fromWidth(100)),
                          backgroundColor:
                          const MaterialStatePropertyAll(
                              Color(0xFFFFFADD)),
                          shape: MaterialStatePropertyAll(
                              ContinuousRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      20)))),
                      child: const Text("Delete",
                          style: TextStyle(
                              color: Color(0xFFF8A400),
                              fontWeight: FontWeight.bold)),
                    ),
                  ],),
              ],
            ),
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
  Future<void> onDelete() async {

    Map<String,String> data={"CarId":widget.productdata.id??"1"};
    var url =
    Uri.parse('https://newappofflutter.000webhostapp.com/deleteCar.php');
    var response = await http.post(url, body: data);
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
