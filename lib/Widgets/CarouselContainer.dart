import 'package:flutter/material.dart';

class CarouselItem extends StatefulWidget {
  String imagePath;
  String department;
  CarouselItem({Key? key, required this.department, required this.imagePath})
      : super(key: key);

  @override
  State<CarouselItem> createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(widget.imagePath.replaceAll('"', '')),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              Text(
                widget.department,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
