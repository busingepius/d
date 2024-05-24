import 'package:d/models/cartegory.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const Color yellow = Color(0xffFDC054);
const Color mediumYellow = Color(0xffFDB846);
const Color darkYellow = Color(0xffE99E22);
const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);
const Color darkGrey = Color(0xff202020);

const LinearGradient mainButton = LinearGradient(
  colors: [
    Color.fromRGBO(236, 60, 3, 1),
    Color.fromRGBO(234, 60, 3, 1),
    Color.fromRGBO(216, 78, 16, 1),
  ],
  begin: FractionalOffset.topCenter,
  end: FractionalOffset.bottomCenter,
);

Map<String, String> navRail = {
  "Valentine's Day":
      'https://res.cloudinary.com/dj8sbqzmv/image/upload/v1674994292/valentines_h5mehj.jpg',
  "Birthday":
      'https://res.cloudinary.com/dj8sbqzmv/image/upload/v1674994292/birthday_rxzeal.webp',
  "Anniversary":
      'https://res.cloudinary.com/dj8sbqzmv/image/upload/v1674994292/anniversary_urozji.jpg',
  "Cakes":
      'https://res.cloudinary.com/dj8sbqzmv/image/upload/v1674994292/cakes_agl0rx.jpg',
  "Flowers":
      'https://res.cloudinary.com/dj8sbqzmv/image/upload/v1674994292/flowers_e643gb.jpg',
  "Personalised":
      'https://res.cloudinary.com/dj8sbqzmv/image/upload/v1674994292/personalised_dqci2v.jpg',
  "Combos & Hampers":
      'https://res.cloudinary.com/dj8sbqzmv/image/upload/v1674994292/combos_and_hampers_yl4sop.jpg',
};

final List<Category> categories = navRail
    .map((key, value) => MapEntry(
          key,
          Category(
            end: const Color(0xffFCE183),
            begin: const Color(0xffF68D7F),
            category: key.split(" ")[0],
            image: value,
          ),
        ))
    .values
    .toList();

Future<void> emailUs() async {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'gegaboxtechnologies@gmail.com',
    query: encodeQueryParameters(<String, String>{
      'subject': 'REPORTING A BUG!',
    }),
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    throw 'Could not launch $emailLaunchUri';
  }
}

Future<void> contactUs() async {
  const String tel = '+256751746511';
  final Uri callLaunchUri = Uri(
    scheme: "tel",
    path: tel,
  );
  if (await canLaunchUrl(callLaunchUri)) {
    await launchUrl(callLaunchUri);
  } else {
    throw 'Could not launch $tel';
  }
}

Future<void> openUrl(String url) async {
  final Uri url0 = Uri.parse(url);
  if (!await launchUrl(url0)) {
    throw Exception('Could not launch $url0');
  }
}
