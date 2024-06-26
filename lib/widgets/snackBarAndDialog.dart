import "package:d/bloc/data/data.dart";
import "package:d/bloc/data/event.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCustomSnackBar({
  required BuildContext context,
  required String message,
}) {
  var snackBar = SnackBar(
    duration:  const Duration(days: 7),
    content: Text(message),
    action: SnackBarAction(
      label: "Try Again",
      textColor: Colors.blueAccent,
      onPressed: () =>
          BlocProvider.of<DataBloc>(context).add(const SplashEvent()),
    ),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          color: Colors.red,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("2222222222222"),
              const Text("1111111111"),
              OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Remove"))
            ],
          ),
        ),
      );
    },
  );
}

void showCustomAboutDialog(BuildContext context) {
  showAboutDialog(
    context: context,
    barrierDismissible: false,
    children: const [
      Text("2222222222222"),
      Text("1111111111"),
    ],
  );
}

PersistentBottomSheetController showBotSheet(BuildContext context) {
  return showBottomSheet(
    context: context,
    builder: (BuildContext context) => const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(Icons.photo),
          title: Text('Photo'),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text('Share'),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.download),
          title: Text('Download'),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.link),
          title: Text('Link'),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.pages),
          title: Text('Pages'),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.menu),
          title: Text('Menu'),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.dashboard_customize_outlined),
          title: Text('Dashboard'),
          onTap: null,
        ),
      ],
    ),
  );
}
