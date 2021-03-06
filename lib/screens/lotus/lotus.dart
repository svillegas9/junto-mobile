import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:junto_beta_mobile/app/custom_icons.dart';
import 'package:junto_beta_mobile/app/logger/logger.dart';
import 'package:junto_beta_mobile/app/screens.dart';
import 'package:junto_beta_mobile/backend/backend.dart';
import 'package:junto_beta_mobile/backend/repositories/onboarding_repo.dart';
import 'package:junto_beta_mobile/generated/l10n.dart';
import 'package:junto_beta_mobile/hive_keys.dart';
import 'package:junto_beta_mobile/screens/collective/collective.dart';
import 'package:junto_beta_mobile/screens/create/create.dart';
import 'package:junto_beta_mobile/screens/den/den.dart';
import 'package:junto_beta_mobile/screens/groups/spheres/spheres_temp.dart';
import 'package:junto_beta_mobile/screens/packs/packs.dart';
import 'package:junto_beta_mobile/widgets/background/background_theme.dart';
import 'package:junto_beta_mobile/widgets/drawer/junto_filter_drawer.dart';
import 'package:junto_beta_mobile/widgets/end_drawer/end_drawer.dart';
import 'package:junto_beta_mobile/widgets/fade_route.dart';
import 'package:junto_beta_mobile/widgets/tutorial/described_feature_overlay.dart';
import 'package:junto_beta_mobile/widgets/tutorial/information_icon.dart';
import 'package:junto_beta_mobile/widgets/tutorial/overlay_info_icon.dart';
import 'package:junto_beta_mobile/app/themes_provider.dart';
import 'package:junto_beta_mobile/app/palette.dart';
import 'package:provider/provider.dart';

class JuntoLotus extends StatefulWidget {
  const JuntoLotus({
    Key key,
    @required this.expressionContext,
    @required this.address,
    @required this.source,
  })  : assert(expressionContext != null),
        assert(address != ''),
        super(key: key);
  final ExpressionContext expressionContext;
  final String address;
  final Screen source;

  @override
  _JuntoLotusState createState() => _JuntoLotusState();
}

class _JuntoLotusState extends State<JuntoLotus> {
  OnBoardingRepo repo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    repo = Provider.of<OnBoardingRepo>(context);
    if (repo.showLotusTutorial) {
      showTutorial();
      repo.setViewed(HiveKeys.kShowLotusTutorial, false);
    }
  }

  /// Pushes new page onto the stack
  /// Allows to go back from the new page
  /// This way Lotus is always in the root of the app
  void _navigateTo(BuildContext context, Screen screen) async {
    final _userProfile =
        Provider.of<UserDataProvider>(context, listen: false).userProfile;
    Widget child;
    if (screen == Screen.collective) {
      child = JuntoCollective();
    } else if (screen == Screen.packs) {
      child = JuntoPacks(initialGroup: _userProfile.pack.address);
    } else if (screen == Screen.groups) {
      child = FeatureDiscovery(
        child: SpheresTemp(),
      );
    } else if (screen == Screen.create) {
      child = FeatureDiscovery(
        child: JuntoCreate(
          channels: const <String>[],
          address: widget.address,
          expressionContext: widget.expressionContext,
        ),
      );
    } else if (screen == Screen.den) {
      child = FeatureDiscovery(
        child: JuntoDen(),
      );
    }
    Navigator.of(context).push(
      FadeRoute<void>(
        child: ReturnToLotusOnSwipe(
          expressionContext: widget.expressionContext,
          address: widget.address,
          source: screen,
          child: child,
        ),
        name: child.runtimeType.toString(),
      ),
    );
    return;
  }

  _onDragEnd(BuildContext context, DragEndDetails dx) {
    if (dx.velocity.pixelsPerSecond.dx > 100) {
      if (widget.source == null || Navigator.canPop(context) == false) {
        logger.logDebug('cannot pop, sorry!');
        return;
      } else {
        _navigateTo(context, widget.source);
      }
    }
  }

  void showTutorial() {
    FeatureDiscovery.clearPreferences(context, <String>{
      'lotus_info_id',
      'lotus_collective_id',
      'lotus_groups_id',
      'lotus_packs_id',
      'lotus_create_id',
    });
    FeatureDiscovery.discoverFeatures(
      context,
      const <String>{
        'lotus_info_id',
        'lotus_collective_id',
        'lotus_groups_id',
        'lotus_packs_id',
        'lotus_create_id',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Consumer<JuntoThemesProvider>(
        builder: (BuildContext context, JuntoThemesProvider theme, child) {
      return GestureDetector(
        onHorizontalDragEnd: (dragDetails) {
          _onDragEnd(context, dragDetails);
        },
        child: JuntoFilterDrawer(
          leftDrawer: null,
          rightMenu: JuntoDrawer(),
          scaffold: Scaffold(
            body: Stack(
              children: <Widget>[
                BackgroundTheme(),
                SafeArea(
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            color: Colors.transparent,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const SizedBox(),
                                    GestureDetector(
                                      onTap: showTutorial,
                                      child: JuntoDescribedFeatureOverlay(
                                        icon: OverlayInfoIcon(),
                                        featureId: 'lotus_info_id',
                                        oneFeature: false,
                                        title:
                                            "Welcome to Junto! This is the intention screen, your medium for navigation. Click 'Next' for a brief description of each section of the app.",
                                        learnMore: true,
                                        learnMoreText: [
                                          'The purpose of the intention screen is to reduce noise and to invite a more mindful, self-directed experience. Instead of immediately being dropped into a feed when you open the app, this screen makes your initial experience a choice and encourages more reflection while navigating between screens.'
                                        ],
                                        hasUpNext: false,
                                        child: JuntoInfoIcon(
                                          neutralBackground: false,
                                          theme: theme,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            .07,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          'JUNTO',
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w400,
                                            color: JuntoPalette()
                                                .juntoWhite(theme: theme)
                                                .withOpacity(.8),
                                            letterSpacing: 3.8,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              JuntoDescribedFeatureOverlay(
                                icon: Icon(
                                  CustomIcons.newcollective,
                                  size: 38,
                                  color: Theme.of(context).primaryColor,
                                ),
                                featureId: 'lotus_collective_id',
                                title:
                                    'Collective: Interact with everyone on Junto.',
                                learnMore: false,
                                hasUpNext: false,
                                isLastFeature: false,
                                child: LotusButton(
                                  label: s.lotus_collective,
                                  icon: CustomIcons.newcollective,
                                  theme: theme,
                                  onTap: () =>
                                      _navigateTo(context, Screen.collective),
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .5,
                                      child: JuntoDescribedFeatureOverlay(
                                        icon: Icon(
                                          CustomIcons.newpacks,
                                          size: 38,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        featureId: 'lotus_packs_id',
                                        title:
                                            'Packs: Interact with your closest friends and their closest friends.',
                                        learnMore: false,
                                        hasUpNext: false,
                                        isLastFeature: false,
                                        contentLocation: ContentLocation.above,
                                        child: LotusButton(
                                          label: s.lotus_packs,
                                          icon: CustomIcons.newpacks,
                                          iconSize: 38,
                                          theme: theme,
                                          onTap: () => _navigateTo(
                                              context, Screen.packs),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .5,
                                      child: JuntoDescribedFeatureOverlay(
                                        icon: Icon(
                                          CustomIcons.newcircles,
                                          size: 38,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        featureId: 'lotus_groups_id',
                                        title:
                                            'Groups: Create and interact in public or private groups.',
                                        learnMore: false,
                                        hasUpNext: false,
                                        isLastFeature: false,
                                        contentLocation: ContentLocation.above,
                                        child: LotusButton(
                                          label: s.lotus_groups,
                                          icon: CustomIcons.newcircles,
                                          theme: theme,
                                          iconSize: 38,
                                          onTap: () => _navigateTo(
                                              context, Screen.groups),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              JuntoDescribedFeatureOverlay(
                                icon: Icon(
                                  CustomIcons.newcreate,
                                  size: 38,
                                  color: Theme.of(context).primaryColor,
                                ),
                                featureId: 'lotus_create_id',
                                title:
                                    'Create: Share expressions in multiple social layers.',
                                learnMore: false,
                                hasUpNext: false,
                                contentLocation: ContentLocation.above,
                                isLastFeature: true,
                                child: (LotusButton(
                                  label: s.lotus_create,
                                  icon: CustomIcons.newcreate,
                                  theme: theme,
                                  iconSize: 38,
                                  onTap: () =>
                                      _navigateTo(context, Screen.create),
                                )),
                              ),
                              const SizedBox(height: 25),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class ReturnToLotusOnSwipe extends StatelessWidget {
  final Widget child;
  final Screen source;
  final String address;
  final ExpressionContext expressionContext;

  const ReturnToLotusOnSwipe(
      {Key key, this.child, this.source, this.address, this.expressionContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class LotusButton extends StatelessWidget {
  const LotusButton({
    @required this.label,
    @required this.icon,
    @required this.onTap,
    @required this.theme,
    this.iconSize,
    Key key,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final JuntoThemesProvider theme;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            borderRadius: BorderRadius.circular(16.0),
            onTap: onTap,
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: Icon(
                      icon,
                      size: iconSize ?? 45,
                      color: JuntoPalette().juntoWhite(theme: theme),
                    ),
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      color: JuntoPalette().juntoWhite(theme: theme),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.4,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
