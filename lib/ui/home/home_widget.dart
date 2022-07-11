import 'package:flutter/material.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/home/account/account_widget.dart';
import 'package:flutter_events/ui/home/events/events_widget.dart';
import 'package:flutter_events/ui/home/personal_events/personal_events_widget.dart';

import 'support_widgets/custom_tab.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            CustomTopBarTab(
              text: Strings.userEvents,
              icon: Icon(Icons.event_available_rounded),
            ),
            CustomTopBarTab(
              text: Strings.events,
              icon: Icon(Icons.event_note_rounded),
            ),
            CustomTopBarTab(
              text: Strings.account,
              icon: Icon(Icons.account_box_rounded),
            ),
          ],
        ),
      ),
      body: Center(
        child: TabBarView(controller: tabController, children: [
          PersonalEventsWidget.create(),
          EventsWidget.create(),
          AccountWidget.create(),
        ]),
      ),
    );
  }
}
