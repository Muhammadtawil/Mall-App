import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Material(
      color: isDarkMode ? const Color(0xff5956E9) : Colors.greenAccent,
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
                // Stack(
                //   children: [
                //     Container(
                //       alignment: Alignment.centerRight,
                //       padding: const EdgeInsets.only(right: 52, bottom: 30),
                //       child: const Image(
                //         image: AssetImage('assets/images/EllipseMorado.png'),
                //       ),
                //     )
                //   ],
                // ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: Text(
                    'Profile',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                    width: 206,
                    child: Padding(
                      padding: EdgeInsets.only(left: 74, right: 0),
                      child: Divider(
                        color: Color(0xfff4f4f8),
                      ),
                    )),
                const ListTile(
                  leading: Icon(Icons.shopping_cart_outlined),
                  title: Text('My orders'),
                ),
                const SizedBox(
                    width: 206,
                    child: Padding(
                      padding: EdgeInsets.only(left: 74, right: 0),
                      child: Divider(
                        color: Color(0xfff4f4f8),
                      ),
                    )),
                const ListTile(
                  leading: Icon(Icons.favorite_border_outlined),
                  title: Text('Favorites'),
                ),
                const SizedBox(
                    width: 206,
                    child: Padding(
                      padding: EdgeInsets.only(left: 74, right: 0),
                      child: Divider(
                        color: Color(0xfff4f4f8),
                      ),
                    )),
                const ListTile(
                  leading: Icon(Icons.shopping_bag_outlined),
                  title: Text('Delivery'),
                ),
                const SizedBox(
                    width: 206,
                    child: Padding(
                      padding: EdgeInsets.only(left: 74, right: 0),
                      child: Divider(
                        color: Color(0xfff4f4f8),
                      ),
                    )),
                const ListTile(
                  leading: Icon(Icons.shopify),
                  title: Text('My Shops'),
                ),
                const SizedBox(
                    width: 206,
                    child: Padding(
                      padding: EdgeInsets.only(left: 74, right: 0),
                      child: Divider(
                        color: Color(0xfff4f4f8),
                      ),
                    )),
                const ListTile(
                  leading: Icon(Icons.settings_outlined),
                  title: Text('Settings'),
                ),
                // Container(
                //   alignment: Alignment.center,
                //   child: const Image(
                //     image: AssetImage('assets/images/EllipseMorado.png'),
                //   ),
                // ),
                // Container(
                //   padding: const EdgeInsets.only(left: 38, top: 17, bottom: 0),
                //   alignment: Alignment.centerLeft,
                //   child: const Image(
                //     image: AssetImage('assets/images/circulomoradorelleno.png'),
                //   ),
                // ),
                const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Sign Out'),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
