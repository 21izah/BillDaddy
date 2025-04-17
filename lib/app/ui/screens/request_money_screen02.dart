import 'package:flutter/material.dart';

import '../../utils/constants/data_constant.dart';

class RequestMoneyScreen02 extends StatefulWidget {
  const RequestMoneyScreen02({super.key});

  @override
  State<RequestMoneyScreen02> createState() => _RequestMoneyScreen02State();
}

class _RequestMoneyScreen02State extends State<RequestMoneyScreen02> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
        centerTitle: false,
        title: w600_17(
          context,
          'Request Money From Others',
          blackColor,
        ),
        backgroundColor: whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // TimelineTile(
            //   isFirst: true,
            //   beforeLineStyle: LineStyle(color: Colors.grey, thickness: 2),
            //   indicatorStyle: IndicatorStyle(
            //     width: 5,
            //     color: secondaryColor,
            //   ),
            // ),
            // TimelineTile(),
            // TimelineTile(
            //   isLast: true,
            // ),
            buildTimelineTile(
              context,
              status: "Transaction Pending",
              date: "2024-01-27",
              time: "14:22:37",
              isCompleted: false,
              isCurrent: true,
              isLast: false,
            ),
            buildTimelineTile(
              context,
              status: "Waiting...",
              isCompleted: false,
              isCurrent: false,
              isLast: false,
              hasDottedBorder: true,
            ),
            buildTimelineTile(
              context,
              status: "Transaction is successful",
              isCompleted: true,
              isCurrent: false,
              isLast: true, // Set to true for the last item
              hasDottedBorder: true,
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.1,
                  bottom: screenSize.height * 0.02,
                ),
                child: Container(
                  height: screenSize.height * 0.05,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondaryColor,
                  ),
                  child: Center(
                    child: w500_17(context, 'Done', whiteColor),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.01,
                  bottom: screenSize.height * 0.02,
                ),
                child: Container(
                  height: screenSize.height * 0.05,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: secondaryColor),
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                  ),
                  child: Center(
                    child: w500_17(context, 'Notify Recipient', secondaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimelineTile(
    BuildContext context, {
    required String status,
    String? date,
    String? time,
    required bool isCompleted,
    required bool isCurrent,
    required bool isLast,
    bool hasDottedBorder = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            // Circle with solid or dotted border based on conditions
            Stack(
              alignment: Alignment.center,
              children: [
                if (hasDottedBorder)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.5,
                        style: BorderStyle.solid,
                        // Using solid here as Flutter doesn't support dotted natively, use a package if needed
                      ),
                    ),
                  ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCurrent
                        ? Colors.blue
                        : isCompleted
                            ? Colors.grey
                            : Colors.transparent,
                    border: Border.all(
                      color: isCurrent || isCompleted
                          ? Colors.grey
                          : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: isCompleted
                      ? Icon(Icons.check, color: Colors.white, size: 12)
                      : isCurrent
                          ? Icon(Icons.autorenew, color: Colors.white, size: 12)
                          : null,
                ),
              ],
            ),
            // Vertical line for connecting steps, omitted if it's the last item
            if (!isLast)
              Container(
                width: 2,
                height: 50,
                color: Colors.grey,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isCurrent ? Colors.black : Colors.grey,
                ),
              ),
              if (date != null && time != null)
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(date, style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 16),
                    Icon(Icons.access_time, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(time, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
