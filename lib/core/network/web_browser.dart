import 'package:flutter/material.dart';
import 'base_web_view.dart';

class WebBrowser extends StatefulWidget {
  final String? url, title;
  const WebBrowser(this.url, this.title, {super.key});
  @override
  State<WebBrowser> createState() {
    return BaseWebview();
  }
}
