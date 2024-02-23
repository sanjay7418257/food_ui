import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class OpenScreen extends StatelessWidget {
  const OpenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/openscreen.jpg',
          ),
          //fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [
              0.2,
              1,
            ],
            colors: [
              Colors.black,
              Colors.transparent,
              //Colors.black.withOpacity(.8),
              // Colors.black.withOpacity(.2),
              // Colors.black.withOpacity(.20),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.orange),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Find the best coffee for you',
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(),
                    ),
                    child: Text(
                      'Skip Now',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size(100, 50),
                    ),
                    onPressed: () {
                      Get.toNamed('/home');
                    },
                    child: Text('Next'),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
