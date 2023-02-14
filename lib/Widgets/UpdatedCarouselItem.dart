import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ku_portal/StudentPortal/ActivitiesPage.dart';
import 'package:ku_portal/StudentPortal/ScholarshipPage.dart';

import '../utils/AppConstants.dart';

class UpdatedCarouselItem extends StatefulWidget {
  String imagePath;
  String heading;
  String subHeading;
  Color color;
  bool page;
  UpdatedCarouselItem(
      {Key? key,
      required this.heading,
      required this.subHeading,
      required this.imagePath,
      required this.color,
      required this.page})
      : super(key: key);

  @override
  _UpdatedCarouselItemState createState() => _UpdatedCarouselItemState();
}

class _UpdatedCarouselItemState extends State<UpdatedCarouselItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppConstants.nextScreen(
            context, widget.page ? const ScholarshipPage() : const ActivitiesPage());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      widget.color.withOpacity(1), BlendMode.hardLight))),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 5, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      widget.heading,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const FaIcon(
                      FontAwesomeIcons.ellipsisVertical,
                      color: Colors.white,
                    )
                  ],
                ),
                Text(
                  widget.subHeading,
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Read More",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
