import 'package:flutter/material.dart';

class ViewDetail extends StatefulWidget {
  const ViewDetail(
      {Key? key, required this.image, required this.text, required this.price})
      : super(key: key);
  final String image;
  final String text;
  final String price;
  @override
  State<ViewDetail> createState() => _ViewDetailState();
}

class _ViewDetailState extends State<ViewDetail> {
  int selected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = 1;
  }

  void select(int index) {
    setState(() {
      selected = index;
    });
  }

  List<double> height = [50, 55, 60];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    widget.image,
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 58,
                left: 30,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(88, 176, 173, 173),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 16,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 240,
                left: 30,
                child: Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(0, 0.1),
                          color: Colors.black,
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 233, 114, 3),
                        size: 12.0,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "4.5",
                        style: TextStyle(
                          color: Color.fromARGB(255, 233, 114, 3),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Espresso",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      widget.text,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 233, 114, 3)),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  widget.price,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Description",
              style: TextStyle(
                  color: Colors.brown.shade800, fontWeight: FontWeight.w900),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "A cappuccino is the perfect balance of espresso, steamed milk and foam. This coffee is all about the structure and the even splitting of all elements into equal thirds. An expertly made cappuccino should be rich, but not acidic and have a mildly sweet flavouring from the milk.",
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "See More",
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 54),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Coffee Size",
              style: TextStyle(
                  color: Colors.brown.shade800, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Row(
                  children:
                      height.asMap().entries.map((MapEntry<int, double> entry) {
                    final int index = entry.key;
                    final double h = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: InkWell(
                        onTap: () {
                          select(index); // Pass index to select method
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selected == index
                                ? Colors.orange
                                : Colors
                                    .transparent, // Apply amber color if selected
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/sizecup.png",
                              height: h,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const Spacer(),
                Column(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: const Icon(
                        Icons.remove,
                        size: 10,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text("1"),
                    const SizedBox(height: 5),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          color: Colors.brown[900],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag, color: Colors.white),
                SizedBox(width: 8),
                Text("Add To bag", style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
