import 'package:eventlyapp/firebase/add_event_moder.dart';
import 'package:eventlyapp/firebase/firebase_utils.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

class EventItem extends StatefulWidget {
  final EventModel event;

  EventItem({required this.event, super.key});

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColor.primaryLightColor,
          width: 2,
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            widget.event.eventImage,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03, vertical: height * 0.008),
                child: Column(
                  children: [
                    Text(
                      widget.event.eventdateTime.day.toString(),
                      style: AppStyle.bold20Primary,
                    ),
                    Text(
                      DateFormat("MMM").format(widget.event.eventdateTime),
                      style: AppStyle.bold14Primarylight,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.006),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.event.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final prev = widget.event.isFav;
                      setState(() {
                        widget.event.isFav = !prev;
                      });
                      try {
                        if (widget.event.id.isEmpty) {
                          throw 'Event id is empty';
                        }
                        await FireBaseUtils.updateEventFav(
                            widget.event.id, widget.event.isFav);
                      } catch (e) {
                        setState(() {
                          widget.event.isFav = prev;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('error$e')),
                        );
                      }
                    },
                    icon: Icon(
                      widget.event.isFav
                          ? Clarity.heart_solid
                          : Clarity.heart_line,
                      color: widget.event.isFav
                          ? AppColor.primaryLightColor
                          : Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
