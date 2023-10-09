import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now_admin/car_detailed_view.dart';
import 'package:go_now_admin/home_page.dart';
import 'package:go_now_admin/splash_screnn.dart';

class ViewCars extends StatefulWidget {
  const ViewCars({super.key});

  @override
  State<ViewCars> createState() => _ViewCarsState();
}

class _ViewCarsState extends State<ViewCars> {
  List<String> carType = ["SEARCH","ALL", "NEW", "OLD", "SPORT", "FAMILY"];
  int catIndex = 1;

  List<Productdata> searchedData=[];
  TextEditingController searchC=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFFFFADD),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          child: Column(
            // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            children: [
              HomePage.srch
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      height: 50,
                      width: double.infinity,
                      child:  TextField(
                        controller: searchC,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: "Search Your Favourite Car...",
                        ),
                        onChanged: (value) {
                          print("==================$value=================");
                          if(value.isEmpty)
                          {
                            setState(() {
                              searchedData=[];
                            });
                          }
                          else
                          {
                            for(int i=0;i<SplashScreen.car.productdata!.length;i++)
                            {
                              if(SplashScreen.car.productdata![i].name!.toLowerCase().contains(value.toLowerCase()))
                              {

                                setState(() {
                                  searchedData=[];
                                  searchedData.add(SplashScreen.car.productdata![i]);
                                });
                              }
                            }
                          }


                        },
                      ),
                    ),
                  ),
                ],
              )
                  : const SizedBox(),
              HomePage.srch
                  ? const SizedBox(
                      height: 10,
                    )
                  : const SizedBox(),
              Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 50,
                            width: double.infinity,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1, mainAxisExtent: 120),
                              itemCount: carType.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    if(index==0)
                                      {
                                        setState(() {
                                          HomePage.srch=true;
                                          print("${HomePage.srch}");
                                        });
                                      }
                                    else
                                      {
                                        setState(() {
                                          HomePage.srch=false;
                                          print("${HomePage.srch}");
                                        });
                                      }
                                    setState(() {
                                      catIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: catIndex == index
                                                ? const Color(0xFF000628)
                                                : const Color(0xFFF8A400)),
                                        borderRadius: BorderRadius.circular(10),
                                        color: catIndex == index
                                            ? const Color(0xFFF8A400)
                                            : null),
                                    child: Center(
                                      child: Text(carType[index],
                                          style: TextStyle(
                                              color: catIndex == index
                                                  ? Colors.white
                                                  : const Color(0xFF000628),
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Color(0xFFF8A400),
                indent: 50,
                endIndent: 50,
                thickness: 1,
              ),
              HomePage.srch
                  ?
              Expanded(
                  child:searchedData!=null? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFF8A400)),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 120,
                                  margin: const EdgeInsets.all(5),
                                  child: Image.network("https://newappofflutter.000webhostapp.com/${searchedData![index].img1}",
                                    repeat: ImageRepeat.noRepeat,
                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                            color: const Color(0xFFF8A400),
                                            strokeWidth: 1,
                                            value:
                                            loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                color: Color(0xFFF8A400),
                                indent: 20,
                                endIndent: 20,
                              ),
                              Expanded(
                                flex: 7,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "${searchedData![index].name}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Status :"),
                                          Text("${searchedData![index].status}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Fuel Type :"),
                                          Text("${searchedData![index].fcondition}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Seating Capacity :"),
                                          Text("${searchedData![index].seat}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.to(()=>CarView(searchedData![index]),transition: Transition.circularReveal,duration: const Duration(milliseconds: 700),);
                                            },
                                            style: ButtonStyle(
                                                fixedSize: const MaterialStatePropertyAll(
                                                    Size.fromWidth(200)),
                                                backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    Color(0xFFFFFADD)),
                                                shape: MaterialStatePropertyAll(
                                                    ContinuousRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            20)))),
                                            child: const Text("View More",
                                                style: TextStyle(
                                                    color: Color(0xFFF8A400),
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: searchedData!.length):Center(child: Text("No Car Founded"),)
              )
                  :
              Expanded(
                child: IndexedStack(
                  index: catIndex,
                  children: [
                  Container(),
                  SplashScreen.car.productdata!=null?ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFF8A400)),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 120,
                                  margin: const EdgeInsets.all(5),
                                  child: Image.network("https://newappofflutter.000webhostapp.com/${SplashScreen.car.productdata![index].img1}",
                                    repeat: ImageRepeat.noRepeat,
                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                            color: Color(0xFFF8A400),
                                            strokeWidth: 1,
                                            value:
                                            loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                color: Color(0xFFF8A400),
                                indent: 20,
                                endIndent: 20,
                              ),
                              Expanded(
                                flex: 7,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "${SplashScreen.car.productdata![index].name}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Status :"),
                                          Text("${SplashScreen.car.productdata![index].status}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Fuel Type :"),
                                          Text("${SplashScreen.car.productdata![index].fcondition}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Seating Capacity :"),
                                          Text("${SplashScreen.car.productdata![index].seat}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.to(()=>CarView(SplashScreen.car.productdata![index]),transition: Transition.circularReveal,duration: const Duration(milliseconds: 700),);
                                            },
                                            style: ButtonStyle(
                                                fixedSize: const MaterialStatePropertyAll(
                                                    Size.fromWidth(200)),
                                                backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    Color(0xFFFFFADD)),
                                                shape: MaterialStatePropertyAll(
                                                    ContinuousRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            20)))),
                                            child: const Text("View More",
                                                style: TextStyle(
                                                    color: Color(0xFFF8A400),
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: SplashScreen.car.productdata!.length):Center(child: Text("NO CAR FOUND"),),
                  SplashScreen.carNew.productdata!=null?ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFF8A400)),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 120,
                                  margin: const EdgeInsets.all(5),
                                  child: Image.network("https://newappofflutter.000webhostapp.com/${SplashScreen.carNew.productdata![index].img1}",
                                    repeat: ImageRepeat.noRepeat,
                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                            color: Color(0xFFF8A400),
                                            strokeWidth: 1,
                                            value:
                                            loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                color: Color(0xFFF8A400),
                                indent: 20,
                                endIndent: 20,
                              ),
                              Expanded(
                                flex: 7,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "${SplashScreen.carNew.productdata![index].name}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Status :"),
                                          Text("${SplashScreen.carNew.productdata![index].status}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Fuel Type :"),
                                          Text("${SplashScreen.carNew.productdata![index].fcondition}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Seating Capacity :"),
                                          Text("${SplashScreen.carNew.productdata![index].seat}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.to(()=>CarView(SplashScreen.carNew.productdata![index]),transition: Transition.circularReveal,duration: const Duration(milliseconds: 700),);
                                            },
                                            style: ButtonStyle(
                                                fixedSize: const MaterialStatePropertyAll(
                                                    Size.fromWidth(200)),
                                                backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    Color(0xFFFFFADD)),
                                                shape: MaterialStatePropertyAll(
                                                    ContinuousRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            20)))),
                                            child: const Text("View More",
                                                style: TextStyle(
                                                    color: Color(0xFFF8A400),
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: SplashScreen.carNew.productdata!.length):Center(child: Text("NO CAR FOUND"),),
                  SplashScreen.carOld.productdata!=null?ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFF8A400)),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 120,
                                  margin: const EdgeInsets.all(5),
                                  child: Image.network("https://newappofflutter.000webhostapp.com/${SplashScreen.carOld.productdata![index].img1}",
                                    repeat: ImageRepeat.noRepeat,
                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                            color: Color(0xFFF8A400),
                                            strokeWidth: 1,
                                            value:
                                            loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                color: Color(0xFFF8A400),
                                indent: 20,
                                endIndent: 20,
                              ),
                              Expanded(
                                flex: 7,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "${SplashScreen.carOld.productdata![index].name}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Status :"),
                                          Text("${SplashScreen.carOld.productdata![index].status}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Fuel Type :"),
                                          Text("${SplashScreen.carOld.productdata![index].fcondition}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Seating Capacity :"),
                                          Text("${SplashScreen.carOld.productdata![index].seat}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.to(()=>CarView(SplashScreen.carOld.productdata![index]),transition: Transition.circularReveal,duration: const Duration(milliseconds: 700),);
                                            },
                                            style: ButtonStyle(
                                                fixedSize: const MaterialStatePropertyAll(
                                                    Size.fromWidth(200)),
                                                backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    Color(0xFFFFFADD)),
                                                shape: MaterialStatePropertyAll(
                                                    ContinuousRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            20)))),
                                            child: const Text("View More",
                                                style: TextStyle(
                                                    color: Color(0xFFF8A400),
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: SplashScreen.carOld.productdata!.length):Center(child: Text("NO CAR FOUND"),),
                  SplashScreen.carSport.productdata!=null?ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFF8A400)),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 120,
                                  margin: const EdgeInsets.all(5),
                                  child: Image.network("https://newappofflutter.000webhostapp.com/${SplashScreen.carSport.productdata![index].img1}",
                                    repeat: ImageRepeat.noRepeat,
                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                            color: Color(0xFFF8A400),
                                            strokeWidth: 1,
                                            value:
                                            loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                color: Color(0xFFF8A400),
                                indent: 20,
                                endIndent: 20,
                              ),
                              Expanded(
                                flex: 7,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "${SplashScreen.carSport.productdata![index].name}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Status :"),
                                          Text("${SplashScreen.carSport.productdata![index].status}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Fuel Type :"),
                                          Text("${SplashScreen.carSport.productdata![index].fcondition}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Seating Capacity :"),
                                          Text("${SplashScreen.carSport.productdata![index].seat}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.to(()=>CarView(SplashScreen.carSport.productdata![index]),transition: Transition.circularReveal,duration: const Duration(milliseconds: 700),);
                                            },
                                            style: ButtonStyle(
                                                fixedSize: const MaterialStatePropertyAll(
                                                    Size.fromWidth(200)),
                                                backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    Color(0xFFFFFADD)),
                                                shape: MaterialStatePropertyAll(
                                                    ContinuousRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            20)))),
                                            child: const Text("View More",
                                                style: TextStyle(
                                                    color: Color(0xFFF8A400),
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: SplashScreen.carSport.productdata!.length):Center(child: Text("NO CAR FOUND"),),
                  SplashScreen.carFamily.productdata!=null?ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFF8A400)),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 120,
                                  margin: const EdgeInsets.all(5),
                                  child: Image.network("https://newappofflutter.000webhostapp.com/${SplashScreen.carFamily.productdata![index].img1}",
                                    repeat: ImageRepeat.noRepeat,
                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                            color: Color(0xFFF8A400),
                                            strokeWidth: 1,
                                            value:
                                            loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                color: Color(0xFFF8A400),
                                indent: 20,
                                endIndent: 20,
                              ),
                              Expanded(
                                flex: 7,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "${SplashScreen.carFamily.productdata![index].name}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Status :"),
                                          Text("${SplashScreen.carFamily.productdata![index].status}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Fuel Type :"),
                                          Text("${SplashScreen.carFamily.productdata![index].fcondition}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Seating Capacity :"),
                                          Text("${SplashScreen.carFamily.productdata![index].seat}"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.to(()=>CarView(SplashScreen.carFamily.productdata![index]),transition: Transition.circularReveal,duration: const Duration(milliseconds: 700),);
                                            },
                                            style: ButtonStyle(
                                                fixedSize: const MaterialStatePropertyAll(
                                                    Size.fromWidth(200)),
                                                backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    Color(0xFFFFFADD)),
                                                shape: MaterialStatePropertyAll(
                                                    ContinuousRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            20)))),
                                            child: const Text("View More",
                                                style: TextStyle(
                                                    color: Color(0xFFF8A400),
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: SplashScreen.carFamily.productdata!.length):Center(child: Text("NO CAR FOUND"),),
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
