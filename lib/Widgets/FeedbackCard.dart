import 'package:flutter/material.dart';

import '../utils/AppConstants.dart';

class FeedbackCard extends StatefulWidget {
  String fbNo, stdName, stdId, stdSem, stdYear, stdDept, subject, desc;
  FeedbackCard(
      {Key? key,
      required this.stdName,
      required this.stdId,
      required this.stdDept,
      required this.stdSem,
      required this.subject,
      required this.stdYear,
      required this.desc,
      required this.fbNo})
      : super(key: key);

  @override
  State<FeedbackCard> createState() => _FeedbackCardState();
}

class _FeedbackCardState extends State<FeedbackCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.fbNo,
            style: TextStyle(color: AppConstants.primaryColor, fontSize: 18),
          ),
          Container(
            height: size.height / 6,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 21,
                          backgroundColor: AppConstants.primaryColor,
                          child: const CircleAvatar(
                            radius: 20,
                            child: Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.stdName,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  "${widget.stdDept} ",
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                Text(
                                  "${widget.stdSem}-${widget.stdYear} ",
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                Text(
                                  widget.stdId,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Subject: ",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.subject,
                          style: TextStyle(
                              color: AppConstants.primaryColor,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                    Text(widget.desc)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
