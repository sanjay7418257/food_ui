import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/detail_controller.dart';
import 'detail_show.dart';

class ContainPrice extends StatelessWidget {
  ContainPrice({
    super.key,
    required this.image,
    required this.text,
    required this.price,
  });

  final List<String> image;
  final List<String> text;
  final List<String> price;
  final viewController = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: image.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewDetail(
                          image: viewController.image[index],
                          price: viewController.price[index],
                          text: viewController.text2[index],
                        )));
          },
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            height: 160,
            width: 170,
            child: Stack(
              children: [
                Positioned(
                  top: 90,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      height: 120,
                      width: 160,
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 40,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Espresso',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 12,
                              ),
                              Text(
                                '4.5',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.orange),
                              ),
                            ],
                          ),
                          Text(
                            text[index],
                            style: const TextStyle(
                                fontSize: 10, color: Colors.black),
                          ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          Row(
                            children: [
                              Text(
                                price[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900),
                              ),
                              const Spacer(),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.orange),
                                child: const Icon(Icons.add,
                                    size: 25, color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 17,
                  child: Container(
                    height: 95,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        image[index],
                        fit: BoxFit.cover,
                        //opacity: AlwaysStoppedAnimation(.1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
