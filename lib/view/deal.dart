import 'package:flutter/material.dart';

class TodaysDeal extends StatelessWidget {
  const TodaysDeal(
      {super.key,
      required this.prices,
      required this.reduced,
      required this.images,
      required this.name});
  final String prices;
  final String reduced;
  final String images;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(
            left: 30,
            top: 10,
            right: 30,
            bottom: 10,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 249, 226, 186)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  images,
                  fit: BoxFit.cover,
                  height: 80,
                  width: 100,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 14,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(fontSize: 14, color: Colors.orange),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        prices,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Stack(
                        children: [
                          Text(
                            reduced,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Transform.rotate(
                            angle: 0 * 3.14 / 180,
                            child: CustomPaint(
                              size: const Size(40, 20), // Adjust size as needed
                              painter: SlashPainter(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 30,
          right: 20,
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.orange),
            child: const Icon(Icons.add, size: 25, color: Colors.white),
          ),
        )
      ],
    );
  }
}

class SlashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(0, size.height * 0.6), Offset(size.width, 5), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
