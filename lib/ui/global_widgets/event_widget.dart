import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/ui/home/events/events_view_model.dart';

class EventWidget<EventT, BlocT extends Bloc> extends StatelessWidget {
  final String name;
  final String place;
  final String dateTime;
  final EventT event;
  final BlocT bloc;

  const EventWidget(
      {Key? key,
      required this.name,
      required this.place,
      required this.dateTime,
      required this.event,
      required this.bloc})
      : super(key: key);

  static const _eventHorizontalPadding = 15.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _eventHorizontalPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(name),
                  Text(place),
                  Text(dateTime),
                ],
              ),
              customIcon()
            ],
          ),
        ),
      ),
    );
  }

  Widget customIcon() {
    return GestureDetector(
      onTap: () => bloc.add(event),
      child: bloc is EventsViewModel
          ? const Icon(Icons.add_box_outlined)
          : const Icon(Icons.delete_outline),
    );
  }
}
