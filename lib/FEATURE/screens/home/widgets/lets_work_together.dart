import 'package:Portfolio/Utils/constants/sizes.dart';
import 'package:Portfolio/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LetsWorkTogether extends StatelessWidget {
  const LetsWorkTogether({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String hexColor = '#200336';
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController whatDoYoNeed = TextEditingController();
    TextEditingController customerMessage = TextEditingController();
    final homeController = Get.put(HomeController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lets Work Together',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: Colors.white),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 4,
        ),
        Text(
          'Are you looking for a dedicated and skilled Flutter developer to bring your ideas to life? With my expertise in building high-performance, cross-platform applications, I am here to help you create seamless and engaging mobile experiences. Whether you need a new app from scratch, enhancements to an existing project, or technical consultation, let\'s collaborate to achieve your goals. Together, we can turn your vision into reality. Reach out to discuss how we can work together and make something amazing!',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: Colors.white),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Container(
            width: 400,
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: whatDoYoNeed,
                  decoration: const InputDecoration(
                    labelText: 'What do you need help with',
                    prefixIcon: Icon(Icons.help),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: customerMessage,
                  decoration: const InputDecoration(
                    labelText: 'Message',
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: homeController.messageSent.value
                                ? Color(int.parse(
                                    hexColor.replaceFirst('#', '0xff')))
                                : Color.fromARGB(255, 2, 42, 205)),
                        onPressed: () {
                          Map<String, dynamic> json = {
                            'name': name.text ?? '',
                            'email': email.text ?? '',
                            'whatDoYoNeed': whatDoYoNeed.text ?? '',
                            'customerMessage': customerMessage.text ?? '',
                          };
                          homeController.updateSingleField(json: json);
                          name.clear();
                          email.clear();
                          whatDoYoNeed.clear();
                          customerMessage.clear();
                        },
                        child: Text(homeController.messageSent.value
                            ? 'Message sent successfully'
                            : 'Submit')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
