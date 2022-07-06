import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/ui/auth/auth_events.dart';
import 'package:flutter_events/ui/auth/auth_view_model_bloc.dart';

class TextButtonWidget<T extends AuthEvent> extends StatelessWidget {
  final T event;
  final String text;

  const TextButtonWidget({Key? key, required this.event, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthViewModelBloc>();

    return TextButton(onPressed: () => bloc.add(event), child: Text(text));
  }
}
