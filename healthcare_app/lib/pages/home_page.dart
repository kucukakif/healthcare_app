import 'package:flutter/material.dart';
import 'package:healthcare_app/colors.dart';
import 'package:healthcare_app/extention.dart';
import 'package:healthcare_app/pages/detail_page.dart';

import '../model/data.dart';
import '../model/doctor_model.dart';
import '../text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<DoctorModel> doctorDataList;
  @override
  void initState() {
    doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.short_text,
          color: Colors.black,
          size: 35,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.notifications_none,
                size: 35,
                color: LightColor.grey,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(13)),
                child: Container(
                  // height: 40,
                  // width: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Image.asset("assets/user.png", fit: BoxFit.fill),
                ),
              ).p(8),
            ],
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Text(
              "Hello,",
              style: TextStyles.title.subTitleColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Text(
              "Peter Parker",
              style: TextStyles.h1Style,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 15, top: 35),
            width: MediaQuery.of(context).size.width - 40,
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: LightColor.grey.withOpacity(.3),
                      blurRadius: 15,
                      offset: const Offset(5, 5))
                ],
                borderRadius: BorderRadius.circular(13)),
            child: const Padding(
              padding: EdgeInsets.only(left: 15, right: 5),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    suffixIcon: Icon(
                      Icons.search,
                      color: LightColor.purple,
                      size: 30,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                      color: LightColor.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 175,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                categoryListItem(
                    title: "Chemist \n& Druggist",
                    subTitle: "350+ Stores",
                    lightColor: LightColor.lightGreen),
                categoryListItem(
                    title: "Covid - 19 Specialist",
                    subTitle: "899 Doctors",
                    lightColor: LightColor.lightBlue),
                categoryListItem(
                    title: "Cardiologists Specialist",
                    subTitle: "500 + Doctors",
                    lightColor: LightColor.lightOrange),
                categoryListItem(
                    title: "    Dermatologist",
                    subTitle: "300 + Doctors",
                    lightColor: LightColor.lightGreen),
                categoryListItem(
                    title: "General Surgeon",
                    subTitle: "500 + Doctors",
                    lightColor: LightColor.lightBlue)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Top Doctors",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.sort,
                      color: LightColor.purple,
                      size: 25,
                    ))
              ],
            ),
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return getdoctorWidgetList();
              })
        ],
      ),
    );
  }

  Widget getdoctorWidgetList() {
    return Column(
        children: doctorDataList.map((x) {
      return _doctorTile(
        model: x,
        press: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(model: x))),
      );
    }).toList());
  }

  GestureDetector _doctorTile(
      {required DoctorModel model, required VoidCallback press}) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 4),
                blurRadius: 10,
                color: LightColor.grey.withOpacity(.2),
              ),
              BoxShadow(
                offset: const Offset(-3, 0),
                blurRadius: 15,
                color: LightColor.grey.withOpacity(.1),
              )
            ]),
        child: ListTile(
          leading: Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(17),
            ),
            child: ClipRRect(
              child: Image.asset(model.image),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                Text(
                  model.type,
                  style: TextStyles.body.subTitleColor,
                )
              ],
            ),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_right,
                color: LightColor.purple,
                size: 35,
              )),
        ),
      ),
    );
  }

  Container categoryListItem(
      {required String title,
      required String subTitle,
      required Color lightColor}) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      width: 130,
      height: 170,
      decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: lightColor.withOpacity(.8),
                blurRadius: 7,
                offset: const Offset(0, 5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(.11),
            radius: 47,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
