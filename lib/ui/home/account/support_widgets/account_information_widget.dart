import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_events/resources/strings.dart';
import 'package:flutter_events/ui/home/account/account_view_model.dart';

class AccountInformationWidget extends StatefulWidget {
  final String login;
  final String email;
  final int years;
  final String gender;
  final String telegram;

  const AccountInformationWidget(
      {Key? key,
      required this.login,
      required this.email,
      required this.years,
      required this.gender,
      required this.telegram})
      : super(key: key);

  @override
  State<AccountInformationWidget> createState() =>
      _AccountInformationWidgetState();
}

class _AccountInformationWidgetState extends State<AccountInformationWidget> {
  static const double _kItemExtent = 32.0;
  final List<int> _ages = [for (var i = 14; i <= 100; i++) i];
  late int _selectedAge;

  @override
  Widget build(BuildContext context) {
    final blocAccount = context.read<AccountViewModel>();
    _selectedAge = blocAccount.state.userModel.years;

    return Column(
      children: [
        customText(Strings.login, widget.login),
        customText(Strings.email, widget.email),
        customTextPicker(Strings.years, widget.years),
        customText(Strings.gender, widget.gender),
        customText(Strings.telegram, widget.telegram),
      ],
    );
  }

  Widget customText<T>(String info, T text) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          '$info: ${text.toString()}',
          style: const TextStyle(
            fontSize: 16,
          ),
        ));
  }

  Widget customTextPicker<T>(String info, T text) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => _showDialog(
            CupertinoPicker(
              magnification: 1.22,
              squeeze: 1.2,
              useMagnifier: true,
              itemExtent: _kItemExtent,
              onSelectedItemChanged: (int selectedItem) {
                setState(() {
                  _selectedAge = selectedItem;
                });
              },
              children: List<Widget>.generate(_ages.length, (int index) {
                return Center(
                  child: Text(
                    _ages[index].toString(),
                  ),
                );
              }),
            ),
          ),
          child: Text(
            _ages[_selectedAge].toString(),
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ));
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 200,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }
}
