import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modal/category.dart';
import '../services/detail_controller.dart';
import 'container_price.dart';
import 'deal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _search = TextEditingController();
  final viewController = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              Container(
                height: size.height / 2,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
              Container(
                height: size.height / 2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06,
                  vertical: size.height * 0.04,
                ),
                width: size.width * 0.7,
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  cursorHeight: 20,
                  controller: _search,
                  decoration: InputDecoration(
                    fillColor: Colors.blueGrey.shade900,
                    filled: true,
                    hintText: 'Search cafe or a coffee...',
                    hintStyle: const TextStyle(
                      color: Colors.orange,
                      fontSize: 14,
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      maxWidth: 48,
                      maxHeight: 55,
                    ),
                    suffixIcon: MaterialButton(
                      onPressed: () {},
                      height: 48,
                      textColor: Colors.white,
                      child: const Icon(
                        Icons.search_rounded,
                        size: 24,
                      ),
                      color: Colors.orange,
                      shape: const CircleBorder(),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/logoimage.jpg',
                ),
                backgroundColor: Colors.orange,
              )
            ],
          ),
          Positioned(
            top: size.height * 0.15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    'Good Morning',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    'Grab your first coffee in this morning',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                listview(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: size.height * 0.3,
                  width: size.width,
                  child: ContainPrice(
                    image: viewController.image,
                    text: viewController.text2,
                    price: viewController.price,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    'Today\'s Deal',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                //TodayDeal(),
                SizedBox(
                  height: size.height * 0.3,
                  width: size.width * 1,
                  child: ListView.builder(
                      itemCount: viewController.images.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TodaysDeal(
                          images: viewController.images[index],
                          prices: viewController.prices[index],
                          reduced: viewController.reducedPrices[index],
                          name: viewController.name[index],
                        );
                      }),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget TodayDeal() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Today\'s Deal',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ],
      ),
    );
  }

  int selectedIndex = 0;

  void select(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<String> text = [
    'Filter',
    'Expresso',
    'Capuccino',
    'Latte',
    'Cold Coffee'
  ];

  final List<double> width = [
    100,
    100,
    100,
    60,
    100,
  ];
  Widget listview() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        margin: const EdgeInsets.only(top: 15, left: 10),
        height: 30,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            itemCount: text.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  select(index);
                },
                child: Container(
                    height: 25,
                    width: width[index],
                    margin: const EdgeInsets.only(right: 10, left: 5),
                    decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Colors.orange
                            : Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        index == 0
                            ? const Icon(
                                Icons.filter_list,
                                color: Colors.white,
                              )
                            : const SizedBox(height: 0, width: 0),
                        index == 0
                            ? const SizedBox(width: 5)
                            : const SizedBox(width: 0),
                        Text(
                          text[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ],
                    )),
              );
            }),
      ),
    );
  }
}
