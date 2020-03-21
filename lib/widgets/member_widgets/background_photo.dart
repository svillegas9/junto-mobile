import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:junto_beta_mobile/models/user_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MemberBackgroundPhoto extends StatelessWidget {
  const MemberBackgroundPhoto({this.profile});

  final UserData profile;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: profile.user.backgroundPhoto,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .2,
      placeholder: (BuildContext context, String _) {
        return Container(
          color: Theme.of(context).dividerColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .2,
        );
      },
      fit: BoxFit.cover,
    );
  }
}