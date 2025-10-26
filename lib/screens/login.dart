import 'package:egtema3elegtema3el3am/screens/dashboard.dart';
import 'package:egtema3elegtema3el3am/widgets/customtext.dart';
import 'package:egtema3elegtema3el3am/widgets/customtextform.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFFE6CFA9),
      body: Center(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: MediaQuery.orientationOf(context) == Orientation.portrait
                ? const EdgeInsets.symmetric(vertical: 20, horizontal: 20)
                : const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png",
                    fit: BoxFit.cover,
                    width: MediaQuery.orientationOf(context) ==
                            Orientation.portrait
                        ? MediaQuery.sizeOf(context).width * 0.6
                        : MediaQuery.sizeOf(context).width * 0.3),
                const SizedBox(
                  height: 30,
                ),
                CustomTextformField(
                    suffix: const Icon(Icons.person),
                    text: "Username",
                    textController: userController),
                const SizedBox(
                  height: 20,
                ),
                CustomTextformField(
                    suffix: const Icon(Icons.lock),
                    text: "Password",
                    textController: passwordController),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (userController.text == "admin" &&
                        passwordController.text == "admin123") {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (cp) {
                        return const Dashboard();
                      }));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: CustomText(
                          text: "Invalid username or password",
                          align: TextAlign.center,
                          isBold: true,
                          colours: 0xFFFFFFFF,
                          fontSize: 15,
                        ),
                        backgroundColor: const Color(0xFF9A3F3F),
                        duration: const Duration(seconds: 2),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      // ignore: use_full_hex_values_for_flutter_colors
                      backgroundColor: const Color(0xFF9C1856D)),
                  child: CustomText(
                    text: "Login",
                    align: TextAlign.center,
                    isBold: true,
                    colours: 0xFFFFFFFF,
                    fontSize: 30,
                  ),
                )
              ],
            )),
      )),
    );
  }
}
