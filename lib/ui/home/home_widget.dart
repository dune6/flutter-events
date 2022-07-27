import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/di/global_factory.dart';
import 'package:flutter_events/domain/entity/user/user_model.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/auth/auth_state.dart';
import 'package:flutter_events/ui/auth/auth_view_model.dart';
import 'package:flutter_events/ui/home/account/account_widget.dart';
import 'package:flutter_events/ui/home/events/events_widget.dart';
import 'package:flutter_events/ui/home/personal_events/personal_events_view_model.dart';
import 'package:flutter_events/ui/home/personal_events/personal_events_widget.dart';
import 'package:flutter_events/ui/splash_screen/splash_view_model.dart';

import 'account/account_view_model.dart';
import 'events/events_view_model.dart';
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                lazy: false,
                create: (_) => PersonalEventsViewModel(
                    const PersonalEventsState(
                        findText: '', events: [], filteredEvents: []),
                    authRepository: GlobalFactory().authService())
                  ..add(GetAccountEventsEvent())),
            BlocProvider(
              lazy: false,
              create: (_) => EventsViewModel(
                const EventsState(findText: '', events: [], filteredEvents: []),
                eventsService: GlobalFactory().eventsService(),
                authRepository: GlobalFactory().authService(),
              )
                ..add(GetEventsEvent())
                ..add(ChangeFindInputEvent('')),
            ),
            BlocProvider(
                create: (_) => SplashViewModel(const SplashState(isAuth: true),
                    authRepository: GlobalFactory().authService())),
            BlocProvider(
                create: (_) => AuthViewModel(const AuthState(),
                    authRepository: GlobalFactory().authService())),
            BlocProvider(
                create: (_) => AccountViewModel(
                    AccountState(
                        isAuth: true, userModel: UserModel.emptyUser()),
                    authRepository: GlobalFactory().authService())
                  ..add(AccountGetUserEvent())), // init user from db
          ],
          child: TabBarView(controller: tabController, children: const [
            PersonalEventsWidget(),
            EventsWidget(),
            AccountWidget(),
          ]),
        ),
      ),
    );
  }
}
