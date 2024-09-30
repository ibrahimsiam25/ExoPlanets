import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final double? height;
  final bool hasSingleChildScrollView;
  final String? backgroundImage;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final bool extendBody;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? resizeToAvoidBottomInset;
  final Key? scaffoldKey;
  const CustomScaffold(
      {super.key,
      this.appBar,
      this.body,
      this.bottomNavigationBar,
      this.bottomSheet,
      this.drawer,
      this.extendBody = false,
      this.floatingActionButton,
      this.floatingActionButtonAnimator,
      this.floatingActionButtonLocation,
      this.resizeToAvoidBottomInset,
      this.scaffoldKey,
      this.backgroundImage,
      this.height,
      this.hasSingleChildScrollView = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      key: scaffoldKey,
      body: hasSingleChildScrollView
          ? SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                height: height ??
                    MediaQuery.of(context).size.height +
                        MediaQuery.of(context).viewPadding.bottom +
                        MediaQuery.of(context).viewPadding.top,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: backgroundImage != null
                      ? DecorationImage(
                          image: AssetImage(
                            backgroundImage!,
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: body,
              ),
            )
          : Container(
              height: height ??
                  MediaQuery.of(context).size.height +
                      MediaQuery.of(context).viewPadding.bottom +
                      MediaQuery.of(context).viewPadding.top,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: backgroundImage != null
                    ? DecorationImage(
                        image: AssetImage(
                          backgroundImage!,
                        ),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: body,
            ),
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      drawer: drawer,
      extendBody: extendBody,
      floatingActionButton: floatingActionButton,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      floatingActionButtonLocation: floatingActionButtonLocation,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
    );
  }
}
