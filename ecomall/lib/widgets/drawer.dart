import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/app_theme_provider.dart';

class AppDrawer extends StatefulWidget {
  final Widget child;
  const AppDrawer({key, required this.child}) : super(key: key);

  // ignore: library_private_types_in_public_api
  static _AppDrawerState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppDrawerState>();

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  static Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  static const double maxSlide = 255;
  static const dragRightStartVal = 60;
  static const dragLeftStartVal = maxSlide - 20;
  static bool shouldDrag = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: _AppDrawerState.duration);
    super.initState();
  }

  void close() => _controller.reverse();

  void open() => _controller.forward();

  void toggle() {
    if (_controller.isCompleted) {
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails startDetails) {
    bool isDraggingFromLeft = _controller.isDismissed &&
        startDetails.globalPosition.dx < dragRightStartVal;
    bool isDraggingFromRight = _controller.isCompleted &&
        startDetails.globalPosition.dx > dragLeftStartVal;
    shouldDrag = isDraggingFromLeft || isDraggingFromRight;
  }

  void _onDragUpdate(DragUpdateDetails updateDetails) {
    if (shouldDrag == false) {
      return;
    }
    double delta = updateDetails.primaryDelta! / maxSlide;
    _controller.value += delta;
  }

  void _onDragEnd(DragEndDetails dragEndDetails) {
    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }

    double kMinFlingVelocity = 365.0;
    double dragVelocity = dragEndDetails.velocity.pixelsPerSecond.dx.abs();

    if (dragVelocity >= kMinFlingVelocity) {
      double visualVelocityInPx = dragEndDetails.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _controller.fling(velocity: visualVelocityInPx);
    } else if (_controller.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          double animationVal = _controller.value;
          double translateVal = animationVal * maxSlide;
          double scaleVal = 1 - (animationVal * 0.3);
          return Stack(
            children: <Widget>[
              const CustomDrawer(),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..translate(translateVal)
                  ..scale(scaleVal),
                child: GestureDetector(
                    onTap: () {
                      if (_controller.isCompleted) {
                        close();
                      }
                    },
                    child: widget.child),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDarkMode = ref.watch(appThemeProvider);
    return SingleChildScrollView(
      child: Material(
        color: isDarkMode
            ? const Color.fromARGB(255, 88, 167, 153)
            : Colors.greenAccent,
        child: SafeArea(
          child: Theme(
            data: ThemeData(
              brightness: Brightness.light,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // color: isDarkMode ? Colors.white : Colors.amber,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  CustomListTile(
                    tileIcon: const Icon(FontAwesomeIcons.userAstronaut),
                    tileText: 'Profile',
                    tileNavigator: () {},
                  ),
                  CustomListTile(
                    tileIcon: const Icon(FontAwesomeIcons.cartShopping),
                    tileText: 'My Orders',
                    tileNavigator: () {},
                  ),
                  CustomListTile(
                    tileIcon: const Icon(FontAwesomeIcons.heart),
                    tileText: 'Favorites',
                    tileNavigator: () {},
                  ),
                  CustomListTile(
                    tileIcon: const Icon(FontAwesomeIcons.truck),
                    tileText: 'Delivery',
                    tileNavigator: () {},
                  ),
                  CustomListTile(
                    tileIcon: const Icon(FontAwesomeIcons.shop),
                    tileText: 'My Shops',
                    tileNavigator: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      isDarkMode ? FontAwesomeIcons.moon : FontAwesomeIcons.sun,
                    ),
                    // Icon(isDarkMode ? Icons.brightness_3 : Icons.sunny),
                    title: Row(
                      children: [
                        Text(
                          isDarkMode ? "Dark mode" : "Light mode",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Consumer(builder: (context, ref, child) {
                          return Transform.scale(
                            scale: 0.7,
                            child: Switch(
                              activeColor: Colors.yellow,
                              onChanged: (value) {
                                ref.read(appThemeProvider.notifier).state =
                                    value;
                              },
                              value: isDarkMode,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  CustomSizedBox(
                    boxHeight: MediaQuery.of(context).size.height * 0.2,
                    boxWidth: MediaQuery.of(context).size.width,
                  ),
                  CustomListTile(
                    tileIcon: const Icon(FontAwesomeIcons.gear),
                    tileText: 'Settings',
                    tileNavigator: () {
                      AppDrawer.of(context)?.close();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Icon tileIcon;
  final String tileText;
  final VoidCallback tileNavigator;
  const CustomListTile({
    required this.tileIcon,
    required this.tileText,
    required this.tileNavigator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tileNavigator,
      child: ListTile(
        leading: tileIcon,
        title: Text(
          tileText,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}

class CustomSizedBox extends StatelessWidget {
  final double boxWidth;
  final double boxHeight;
  const CustomSizedBox({
    required this.boxHeight,
    required this.boxWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: boxWidth,
        height: boxHeight,
        child: const Padding(
          padding: EdgeInsets.only(left: 74, right: 0),
          child: Divider(color: Colors.transparent),
        ));
  }
}
