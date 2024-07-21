import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp/FEATURE/screens/home/widgets/app_bar.dart';
import 'package:webapp/FEATURE/screens/home/widgets/intro_and_profile.dart';
import 'package:webapp/FEATURE/screens/home/widgets/lets_work_together.dart';
import 'package:webapp/FEATURE/screens/home/widgets/product.dart';
import 'package:webapp/FEATURE/screens/home/widgets/social_media.dart';
import 'package:webapp/Utils/constants/image_strings.dart';
import 'package:webapp/Utils/constants/sizes.dart';
import 'package:webapp/common/device_frame.dart';
import 'package:webapp/common/frosted_glass.dart';
import 'package:webapp/common/rounded_container.dart';
import 'package:webapp/common/rounded_image.dart';
import 'package:webapp/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());
  @override
  void initState() {
    homeController.admin();
    homeController.fetchAllFields();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Get.put(HomeController());
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const XAppBar(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(XImages.background), fit: BoxFit.cover)),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              IntroAndProfile(size: size),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -------------------------------------------------latwst projects
              Text('Latest Projects',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .apply(color: Colors.white)),
              const SizedBox(height: 20),
              RepaintBoundary(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 230,
                        child: Obx(
                          () => ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: TSizes.spaceBtwItems,
                                  ),
                              itemCount: homeController.appDataList.length,
                              itemBuilder: (context, index) {
                                final appdata =
                                    homeController.appDataList[index];
                                return FrostedGlass(
                                    theWidth: 200,
                                    child: Column(
                                      children: [
                                        XRoundedContainer(
                                          ontap: () {
                                            Get.to(() => Product(
                                                  details: appdata.details,
                                                ));
                                          },
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 5),
                                          backgroundColor: Colors.transparent,
                                          height: 180,
                                          width: 180,
                                          child: appdata.details!.imageList!
                                                      .length >
                                                  0
                                              ? XdeviceFrame(
                                                  padding: EdgeInsets.all(5),
                                                  backGroundColor:
                                                      Color.fromARGB(
                                                          255, 255, 255, 255),
                                                  isNetworkImage: true,
                                                  fit: BoxFit.contain,
                                                  imageurl: appdata
                                                      .details!.imageList![0],
                                                  applyImageRadius: true)
                                              : const TRoundedImage(
                                                  imageurl: XImages.no,
                                                  applyImageRadius: true),
                                        ),
                                        Text(
                                          appdata.name.toString(),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(appdata.subtitle.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .apply(color: Colors.white))
                                      ],
                                    ));
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 20,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              ),
              const LetsWorkTogether(),
              const SizedBox(
                height: 50,
              ),
              const FrostedGlass(
                theHeight: 140,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Thank you for visiting my portfolio! I invite you to explore and see how my skills and experiences align with your project needs. Let’s create something amazing together!',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialMedia(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
