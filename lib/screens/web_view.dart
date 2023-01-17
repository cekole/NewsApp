import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  const WebView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller =
        ModalRoute.of(context)!.settings.arguments as WebViewController;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
