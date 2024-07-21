import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:webapp/FEATURE/screens/home/widgets/app_bar.dart';
import 'package:webapp/Utils/constants/image_strings.dart';
import 'package:webapp/Utils/constants/sizes.dart';
import 'package:webapp/common/device_frame.dart';
import 'package:webapp/common/frosted_glass.dart';
import 'package:webapp/common/rounded_container.dart';
import 'package:webapp/common/rounded_image.dart';
import 'package:webapp/model/app_model.dart';

class Product extends StatefulWidget {
  const Product({super.key, required this.details});

  @override
  State<Product> createState() => _ProductState();
  final DetailsModel? details;
}

int pageindex = 0;

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    print(widget.details!.imageList![0].toString());
    final double size = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const XAppBar(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(XImages.background), fit: BoxFit.cover)),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FrostedGlass(
                      theHeight: 450,
                      theWidth: size > 600 ? 500 : size - 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              width: 350,
                              height: 400,
                              child: CarouselSlider(
                                  items: widget.details!.imageList!
                                      .map((banner) => Padding(
                                            padding: const EdgeInsets.all(3),
                                            child: XdeviceFrame(
                                              width: 340,
                                              onPressed: () {},
                                              padding: const EdgeInsets.all(5),
                                              applyImageRadius: true,
                                              isNetworkImage: true,
                                              backGroundColor: Colors.black12,
                                              borderRadius: 15,
                                              imageradius: 15,
                                              fit: BoxFit.cover,
                                              nocacheNetworkImage: false,
                                              imageurl: widget.details!
                                                  .imageList![pageindex]
                                                  .toString(),
                                            ),
                                          ))
                                      .toList(),
                                  options: CarouselOptions(
                                      onPageChanged: (index, reason) =>
                                          setState(() {
                                            pageindex = index;
                                          }),
                                      // autoPlay: true,
                                      // autoPlayInterval: const Duration(seconds: 5),
                                      viewportFraction: 1)),
                            ),
                            const SizedBox(height: TSizes.spaceBtwItems),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                for (int i = 0;
                                    i < widget.details!.imageList!.length;
                                    i++)
                                  XRoundedContainer(
                                      width: 20,
                                      height: 4,
                                      margin: const EdgeInsets.only(right: 10),
                                      backgroundColor: pageindex == i
                                          ? Colors.white
                                          : Colors.black),
                              ],
                            ),
                          ],
                        ),
                      )),
                  if (size > 850)
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: SizedBox(
                        width: size > 1325 ? 700 : size - 700,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.details!.title ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .apply(color: Colors.white)),
                            SizedBox(height: 10),
                            Text(widget.details!.text1 ?? '',
                                style: TextStyle(fontSize: 18)),
                            Text(widget.details!.text2 ?? '',
                                style: TextStyle(fontSize: 18)),
                            Text(widget.details!.text2 ?? '',
                                style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
