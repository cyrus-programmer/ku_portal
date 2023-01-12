import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class NewsCard extends StatefulWidget {
  String heading, subHeading;
  IconData icon;
  NewsCard(
      {Key? key,
      required this.heading,
      required this.subHeading,
      required this.icon})
      : super(key: key);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: size.width / 2.3,
        height: size.height / 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: const AssetImage('assets/ku.png'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    HexColor("#83000A").withRed(255), BlendMode.darken))),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.ellipsisVertical,
                    color: Colors.white,
                  ))
            ],
          ),
          FaIcon(
            widget.icon,
            color: Colors.white,
            size: 35,
          ),
          Text(
            widget.heading,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Text(
            widget.subHeading,
            style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
          )
        ]),
      ),
    );
  }
}
