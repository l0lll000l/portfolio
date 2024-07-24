import 'package:Portfolio/FEATURE/screens/home/widgets/lets_work_together.dart';
import 'package:Portfolio/FEATURE/screens/home/widgets/product.dart';
import 'package:Portfolio/FEATURE/screens/home/widgets/thanks.dart';
import 'package:Portfolio/Utils/constants/image_strings.dart';
import 'package:Portfolio/Utils/constants/sizes.dart';
import 'package:Portfolio/common/device_frame.dart';
import 'package:Portfolio/common/frosted_glass.dart';
import 'package:Portfolio/common/rounded_container.dart';
import 'package:Portfolio/common/rounded_image.dart';
import 'package:Portfolio/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/app_bar.dart';
import 'widgets/intro_and_profile.dart';

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
          padding: EdgeInsets.only(
              left: 50, right: 50, top: size.width > 550 ? 50.1 : 10.1),
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
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  backGroundColor:
                                                      const Color.fromARGB(
                                                          255, 255, 255, 255),
                                                  isNetworkImage: true,
                                                  fit: BoxFit.contain,
                                                  imageurl: appdata
                                                      .details!.imageList![0],
                                                  applyImageRadius: true)
                                              : TRoundedImage(
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
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 20,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                ],
              ),
              const LetsWorkTogether(),
              const SizedBox(
                height: 50,
              ),
              Thanks(),
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
