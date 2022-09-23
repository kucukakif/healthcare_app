import 'package:flutter/material.dart';
import 'package:healthcare_app/colors.dart';
import 'package:healthcare_app/model/doctor_model.dart';
import 'package:healthcare_app/widgets/rating_widget.dart';

import '../widgets/progress_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.model});
  final DoctorModel model;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DoctorModel model;
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Stack(
              children: [
                Container(
                  color: const Color.fromARGB(255, 188, 211, 230),
                  padding: const EdgeInsets.only(top: 15),
                  child: Image.asset(
                    model.image,
                    width: double.infinity,
                    height: 300,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 290),
                  width: double.infinity,
                  height: 450,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              model.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.check_circle,
                              size: 20,
                              color: LightColor.purple,
                            ),
                            const Spacer(),
                            RatingStar(rating: model.rating),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            model.type,
                            style: const TextStyle(
                                color: LightColor.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 0.8,
                          height: 1,
                          color: LightColor.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            ProgressWidget(
                                value: model.goodReviews,
                                totalValue: 100,
                                activeColor: LightColor.purpleExtraLight,
                                backgroundColor:
                                    LightColor.grey.withOpacity(.3),
                                title: "Good Review",
                                durationTime: 500),
                            ProgressWidget(
                                value: model.totalScore,
                                totalValue: 100,
                                activeColor: LightColor.purpleLight,
                                backgroundColor:
                                    LightColor.grey.withOpacity(.3),
                                title: "Total Score",
                                durationTime: 300),
                            ProgressWidget(
                                value: model.satisfaction,
                                totalValue: 100,
                                activeColor: LightColor.purple,
                                backgroundColor:
                                    LightColor.grey.withOpacity(.3),
                                title: "Satisfaction",
                                durationTime: 800),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 0.7,
                          height: 1,
                          color: LightColor.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 160,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "About",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                model.description,
                                style: const TextStyle(
                                  color: LightColor.grey,
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          _bottomWidget(icon: Icons.call, left: 17),
                          _bottomWidget(icon: Icons.chat_bubble, left: 10),
                          Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.only(left: 10, top: 5),
                              height: 60,
                              width: 220,
                              decoration: BoxDecoration(
                                  color: LightColor.purple,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                "Make an appointment",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                _appBar(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _bottomWidget({required IconData icon, required double left}) {
    return Container(
      margin: EdgeInsets.only(left: left, top: 8),
      height: 60,
      width: 70,
      decoration: BoxDecoration(
          color: LightColor.grey, borderRadius: BorderRadius.circular(20)),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Padding _appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: LightColor.purple,
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  model.isfavourite = !model.isfavourite;
                });
              },
              icon: Icon(
                model.isfavourite ? Icons.favorite : Icons.favorite_border,
                size: 30,
                color: model.isfavourite ? LightColor.purple : LightColor.grey,
              ))
        ],
      ),
    );
  }
}
