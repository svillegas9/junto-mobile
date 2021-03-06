import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:junto_beta_mobile/app/expressions.dart';
import 'package:junto_beta_mobile/backend/repositories/expression_repo.dart';
import 'package:junto_beta_mobile/models/expression.dart';
import 'package:junto_beta_mobile/screens/create/create_actions/create_actions.dart';
import 'package:junto_beta_mobile/screens/create/create_actions/create_comment_actions.dart';
import 'package:junto_beta_mobile/screens/create/create_actions/widgets/create_expression_scaffold.dart';
import 'package:junto_beta_mobile/widgets/dialogs/single_action_dialog.dart';
import 'package:junto_beta_mobile/widgets/image_cropper.dart';
import 'package:provider/provider.dart';
import 'audio_service.dart';
import 'widgets/audio_bottom_tools.dart';
import 'widgets/audio_photo_options.dart';
import 'widgets/audio_record.dart';
import 'widgets/audio_review.dart';

class CreateAudio extends StatefulWidget {
  const CreateAudio({Key key, this.expressionContext, this.address})
      : super(key: key);
  final ExpressionContext expressionContext;
  final String address;

  @override
  State<StatefulWidget> createState() {
    return CreateAudioState();
  }
}

class CreateAudioState extends State<CreateAudio> {
  bool _showBottomTools = true;
  final FocusNode captionFocus = FocusNode();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController captionController = TextEditingController();
  File audioPhotoBackground;
  List<String> audioGradientValues = [];

  Future<void> _onPickPressed({String source}) async {
    try {
      final imagePicker = ImagePicker();
      PickedFile file;
      if (source == 'Camera') {
        file = await imagePicker.getImage(source: ImageSource.camera);
      } else if (source == 'Gallery') {
        file = await imagePicker.getImage(source: ImageSource.gallery);
      } else {
        file = await imagePicker.getImage(source: ImageSource.camera);
      }
      final image = File(file.path);

      if (image == null && audioPhotoBackground == null) {
        setState(() => audioPhotoBackground = null);
        return;
      } else if (image == null && audioPhotoBackground != null) {
        return;
      }

      final File cropped = await ImageCroppingDialog.show(
        context,
        image,
        aspectRatios: <String>[
          '1:1',
          '2:3',
          '3:2',
          '3:4',
          '4:3',
          '4:5',
          '5:4',
          '9:16',
          '16:9'
        ],
      );
      Navigator.of(context).focusScopeNode.unfocus();
      if (cropped == null) {
        setState(() => audioPhotoBackground = null);

        return;
      }

      setState(() {
        audioPhotoBackground = cropped;
        audioGradientValues = [];
      });
    } catch (error) {
      print(error);
    }
  }

  void _resetAudioPhotoBackground() {
    setState(() {
      audioPhotoBackground = null;
    });
  }

  void _resetAudioGradientValues() {
    setState(() {
      audioGradientValues = [];
    });
  }

  void _setAudioGradientValues(String hexOne, String hexTwo) {
    _resetAudioPhotoBackground();
    setState(() {
      audioGradientValues = [hexOne, hexTwo];
    });
  }

  void _audioPhotoOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      builder: (BuildContext context) => AudioPhotoOptions(
        updatePhoto: _onPickPressed,
        resetPhoto: _resetAudioPhotoBackground,
      ),
    );
  }

  void _toggleBottomTools() {
    setState(() {
      _showBottomTools = !_showBottomTools;
    });
  }

  @override
  void initState() {
    super.initState();
    captionFocus.addListener(_toggleBottomTools);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AudioService>(
      create: (context) => AudioService(),
      child: Consumer<AudioService>(builder: (context, audio, child) {
        return CreateExpressionScaffold(
          onNext: () => _onNext(audio),
          showBottomNav: !audio.playBackAvailable,
          expressionType: ExpressionType.audio,
          child: Expanded(
            child: Stack(
              children: <Widget>[
                !audio.playBackAvailable
                    ? AudioRecord()
                    : AudioReview(
                        audioPhotoBackground: audioPhotoBackground,
                        audioGradientValues: audioGradientValues,
                        titleController: titleController,
                        captionController: captionController,
                        captionFocus: captionFocus,
                      ),
                if (audio.playBackAvailable && _showBottomTools)
                  AudioBottomTools(
                    openPhotoOptions: _audioPhotoOptions,
                    resetAudioPhotoBackground: _resetAudioPhotoBackground,
                    resetAudioGradientValues: _resetAudioGradientValues,
                    setAudioGradientValues: _setAudioGradientValues,
                  )
              ],
            ),
          ),
        );
      }),
    );
  }

  void _onNext(AudioService audio) {
    if (_validate(audio)) {
      final audioExpression = AudioFormExpression(
        title: titleController.text.trim(),
        photo: audioPhotoBackground?.path,
        audio: audio.recordingPath,
        gradient: audioGradientValues,
        caption: captionController.text.trim(),
      );

      Navigator.push(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) {
            if (widget.expressionContext == ExpressionContext.Comment) {
              return CreateCommentActions(
                expression: audioExpression,
                address: widget.address,
                expressionType: ExpressionType.audio,
              );
            } else {
              return CreateActions(
                expressionType: ExpressionType.audio,
                address: widget.address,
                expressionContext: widget.expressionContext,
                expression: audioExpression,
              );
            }
          },
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => const SingleActionDialog(
          dialogText: "Seems like you haven't recorded anything",
        ),
      );
      return;
    }
  }

  bool _validate(AudioService audio) {
    if (audio.playBackAvailable && audio.recordingPath != null
        //TODO: add validation for title and image if necessary
        ) {
      return true;
    }
    return false;
  }
}
