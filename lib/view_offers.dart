import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now_admin/splash_screnn.dart';
import 'package:http/http.dart' as http;
import 'home_page.dart';

class OfferView extends StatefulWidget {
  const OfferView({super.key});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFADD),
        body:SplashScreen.offers.offerdata!=null? ListView.builder(
          itemCount: SplashScreen.offers.offerdata!.length,
          itemBuilder: (context, index) {
            return Container(
              width: 400,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF8A400)),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("${SplashScreen.offers.offerdata![index].offerName}",style: TextStyle(color: Color(0xFFF8A400),fontSize: 22,fontWeight: FontWeight.bold))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${SplashScreen.offers.offerdata![index].offerDesc}",style: TextStyle(color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                    ),Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("CODE : ${SplashScreen.offers.offerdata![index].offerCode}",style: TextStyle(color: Color(0xFFF8A400),fontSize: 14,fontWeight: FontWeight.w400)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${SplashScreen.offers.offerdata![index].offerDate}",style: TextStyle(color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w700)),
                          InkWell(onTap:() {
                            showDialog(context: context, barrierDismissible: false,builder: (context) {
                              return Center(child: CircularProgressIndicator(),);
                            },);
                            sendData(SplashScreen.offers.offerdata![index].offerId??"1").whenComplete(() => getOfferData().whenComplete(() {
                              Get.back();
                              setState(() {
                                HomePage.btmIndex=1;
                                Get.forceAppUpdate();
                              });
                            },));
                            //Get.offAll(()=>const HomePage());
                          },child: Text("Delete Offer ? ",style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline,fontSize: 14,fontWeight: FontWeight.w700))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ) : Center(child: Text("No Offers Founded."),)
    );
  }
  Future<void> sendData(String Id) async {



    Map<String, String> CarData = {
      'offerId': Id,

    };

    var url =
    Uri.parse('https://newappofflutter.000webhostapp.com/deleteOffer.php');
    var response = await http.post(url, body: CarData);
  }


  Future<void> getOfferData() async {
    var url = Uri.parse(
        'https://newappofflutter.000webhostapp.com/offers.php');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      setState(() {
        SplashScreen.offers=OffersData.fromJson(responseBody);
      });
    }
  }
}
