import 'package:flutter/material.dart';
import 'package:junto_beta_mobile/custom_icons.dart';
import 'package:junto_beta_mobile/models/perspective.dart';
import 'package:junto_beta_mobile/palette.dart';
import 'package:junto_beta_mobile/providers/user_provider.dart';
import 'package:junto_beta_mobile/utils/junto_dialog.dart';
import 'package:junto_beta_mobile/utils/junto_overlay.dart';
import 'package:provider/provider.dart';

class CreatePerspective extends StatefulWidget {
  @override
  _CreatePerspectiveState createState() => _CreatePerspectiveState();
}

class _CreatePerspectiveState extends State<CreatePerspective> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> createPerspective() async {
    final String name = controller.value.text;
    JuntoOverlay.showLoader(context);
    final CentralizedPerspective address =
        await Provider.of<UserProvider>(context)
            .createPerspective(Perspective(name: name));
    JuntoOverlay.hide();
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: AppBar(
          automaticallyImplyLeading: false,
          brightness: Brightness.light,
          iconTheme: const IconThemeData(
            color: JuntoPalette.juntoSleek,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    CustomIcons.back_arrow_left,
                    color: JuntoPalette.juntoSleek,
                    size: 24,
                  ),
                ),
                Text(
                  'New perspective',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () {
                    if (controller.value.text != '') {
                      createPerspective();
                    } else {
                      return;
                    }
                  },
                  enableFeedback: false,
                  child: const Text(
                    'create',
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xffeeeeee),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        // padding: EdgeInsets.symmetric(vertical: 15),
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xffeeeeee),
                              width: .75,
                            ),
                          ),
                        ),
                        child: TextField(
                          controller: controller,
                          buildCounter: (
                            BuildContext context, {
                            int currentLength,
                            int maxLength,
                            bool isFocused,
                          }) =>
                              null,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name your perspective',
                            hintStyle: const TextStyle(
                                color: Color(0xff999999),
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          cursorColor: Color(0xff333333),
                          cursorWidth: 2,
                          maxLines: null,
                          style: const TextStyle(
                              color: Color(0xff333333),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                          maxLength: 80,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xffeeeeee),
                              width: .75,
                            ),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              CustomIcons.half_lotus,
                              size: 17,
                              color: Color(0xff333333),
                            ),
                            SizedBox(width: 20),
                            Text(
                              'add members',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
