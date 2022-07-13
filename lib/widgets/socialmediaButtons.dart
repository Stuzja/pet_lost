import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

enum SocialMedia { facebook, twitter, vk, ok }

Widget buildBigSocialButtons() => Row(children: [
      buildBigSocialButton(
        icon: FontAwesomeIcons.facebookSquare,
        color: Color(0xFF0075fc),
        onClicked: () => share(SocialMedia.facebook),
      ),
      const SizedBox(
        width: 8,
      ),
      buildBigSocialButton(
        icon: FontAwesomeIcons.twitter,
        color: Color(0xFF1da1f2),
        onClicked: () => share(SocialMedia.twitter),
      ),
      const SizedBox(
        width: 8,
      ),
    ]);

Future share(SocialMedia socialPlatform) async {
  final text = 'Пропал питомец';
  final urls = {
    SocialMedia.facebook: 'https://www.facebook.com/sharer.php?u=&t=$text',
    SocialMedia.twitter: 'https://twitter.com/share?url={}&text',
    SocialMedia.vk: 'http://vk.com/share.php?url=&title=&description=&image=&noparse=true',
    SocialMedia.ok: 'http://vk.com/share.php?url=&title=&description=&image=&noparse=true'
  };
  final url = urls[socialPlatform]!;

  if (await canLaunch(url)) {
    await launch(url);
  }
}

Widget buildBigSocialButton({
  required IconData icon,
  Color? color,
  required VoidCallback onClicked,
}) =>
    InkWell(
      child: Container(
          width: 44,
          height: 44,
          child: Center(
            child: FaIcon(icon, color: color, size: 44),
          )),
      onTap: onClicked,
    );

Widget buildSmallSocialButton({
  required IconData icon,
  required VoidCallback onClicked,
}) =>
    InkWell(
      child: Container(
          width: 19,
          height: 19,
          child: Center(
            child: FaIcon(icon, color: Colors.black87, size: 20),
          )),
      onTap: onClicked,
    );
