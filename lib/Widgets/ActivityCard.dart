import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/AppConstants.dart';

class ActivityCard extends StatefulWidget {
  String activity;
  String heading;
  String subHeading;
  String timing;
  String cost;
  String buttonText;

  ActivityCard(
      {Key? key,
      required this.activity,
      required this.heading,
      required this.subHeading,
      required this.cost,
      required this.timing,
      required this.buttonText})
      : super(key: key);

  @override
  _ActivityCardState createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Container(
        height: size.height / 4,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.activity,
              style: TextStyle(color: AppConstants.primaryColor, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 3, top: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.6),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 6,
                          blurRadius: 8,
                          offset:
                              const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    height: size.height / 6,
                    width: size.width / 1.21,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.heading,
                                style: TextStyle(fontSize: 16),
                              ),
                              Container(
                                height: 25,
                                width: 70,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(child: Text(widget.buttonText)),
                              )
                            ],
                          ),
                          Text(
                            widget.subHeading,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Expanded(child: Container()),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.clock,
                                size: 14,
                                color: Colors.grey,
                              ),
                              // ignore: prefer_const_constructors
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  widget.timing,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: const FaIcon(
                                      FontAwesomeIcons.dollarSign,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      widget.cost,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "Read More",
                                style:
                                    TextStyle(color: AppConstants.primaryColor),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        size: 40,
                        color: AppConstants.primaryColor,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
