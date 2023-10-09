import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now_admin/home_page.dart';
import 'package:go_now_admin/splash_screnn.dart';
import 'package:go_now_admin/view_offers.dart';
import 'package:http/http.dart' as http;

class AddOfferView extends StatefulWidget {
  const AddOfferView({super.key});

  @override
  State<AddOfferView> createState() => _AddOfferViewState();
}

class _AddOfferViewState extends State<AddOfferView> {
  TextEditingController offerName = TextEditingController();
  TextEditingController offerDesc = TextEditingController();
  TextEditingController offerDate = TextEditingController();
  TextEditingController offerCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFADD),
      body: Padding(
        padding: const EdgeInsets.only(top: 10,left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

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
                controller: offerName,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Offer Name...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.local_offer_outlined)),
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
                controller: offerDesc,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Offer Description...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.description)),
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
                controller: offerCode,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Offer Code...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.qr_code)),
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
                controller: offerDate,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Enter Offer Validity...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.timer)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    showDialog(context: context, barrierDismissible: false,builder: (context) {
                      return Center(child: CircularProgressIndicator(),);
                    },);
                    sendData().whenComplete(() => getOfferData().whenComplete(() {
                      Get.back();
                      setState(() {
                        HomePage.btmIndex=1;
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
                  child: const Text("SEND OFFER")),
            ),
          ],
        ),
      )
    );
  }

  Future<void> sendData() async {
    String Offer_Name = offerName.text.toString();
    String Offer_Description = offerDesc.text.toString();
    String Offer_Date = offerDate.text.toString();
    String Offer_Code = offerCode.text.toString();


    Map<String, String> CarData = {
      'Offer_Name': Offer_Name,
      'Offer_Description': Offer_Description,
      'Offer_Date': Offer_Date,
      'Offer_Code': Offer_Code
    };

    var url =
    Uri.parse('https://newappofflutter.000webhostapp.com/addOfferData.php');
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
