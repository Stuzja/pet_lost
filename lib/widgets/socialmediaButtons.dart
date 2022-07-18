import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

enum SocialMedia { facebook, twitter, vk, ok }

Widget buildBigSocialButtons() => Row(children: [
      buildBigSocialButton(
        icon: FontAwesomeIcons.facebookSquare,
        color: const Color(0xFF0075fc),
        onClicked: () => share(SocialMedia.facebook),
      ),
      const SizedBox(
        width: 8,
      ),
      buildBigSocialButton(
        icon: FontAwesomeIcons.twitter,
        color: const  Color(0xFF1da1f2),
        onClicked: () => share(SocialMedia.twitter),
      ),
      const SizedBox(
        width: 8,
      ),
      buildBigSocialButton(
        icon: FontAwesomeIcons.vk,
        color: const Color.fromRGBO(39, 135, 245, 1),
        onClicked: () => share(SocialMedia.vk),
      ),
    ]);

Widget buildSmallSocialButtons() => Row(children: [
      buildSmallSocialButton(
        icon: FontAwesomeIcons.vk,
        onClicked: () => share(SocialMedia.vk),
      ),
      const SizedBox(
        width: 11,
      ),
      buildSmallSocialButton(
        icon: FontAwesomeIcons.odnoklassniki,
        onClicked: () => share(SocialMedia.ok),
      ),
      const SizedBox(
        width: 11,
      ),
      buildSmallSocialButton(
        icon: FontAwesomeIcons.facebookSquare,
        onClicked: () => share(SocialMedia.facebook),
      ),
      const SizedBox(
        width: 11,
      ),
      buildSmallSocialButton(
        icon: FontAwesomeIcons.twitter,
        onClicked: () => share(SocialMedia.twitter),
      ),
    ]);

Future share(SocialMedia socialPlatform) async {
  const text = 'Пропал питомец';
  final urls = {
    SocialMedia.facebook:
        'https://www.facebook.com/sharer/sharer.php?u=&picture=',
    SocialMedia.twitter:
        'https://twitter.com/share?url=&text=$text&hashtags=&via=',
    SocialMedia.vk:
        'https://vk.com/share.php?url=&title=&description=&comment=Пропал питомец&image=&noparse=true',
    SocialMedia.ok: 'https://ok.ru/post'
  };
  final url = Uri.parse(urls[socialPlatform]!);

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  }
}

Widget buildBigSocialButton({
  required IconData icon,
  Color? color,
  required VoidCallback onClicked,
}) =>
    InkWell(
      onTap: onClicked,
      child: SizedBox(
          width: 44,
          height: 44,
          child: Center(
            child: FaIcon(icon, color: color, size: 44),
          )),
    );

Widget buildSmallSocialButton({
  required IconData icon,
  required VoidCallback onClicked,
}) =>
    InkWell(
      onTap: onClicked,
      child: SizedBox(
          width: 19,
          height: 19,
          child: Center(
            child: FaIcon(icon, color: Colors.black87, size: 20),
          )),
    );
