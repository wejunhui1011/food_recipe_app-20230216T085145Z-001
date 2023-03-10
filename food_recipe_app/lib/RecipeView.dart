// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class RecipeView extends StatefulWidget {

String url;
RecipeView(this.url);
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  late  String finalUrl;
  final Completer<WebViewController> controller = Completer<WebViewController>();
  @override
  void initState() {
    if(widget.url.toString().contains("https://"))
      {
        finalUrl = widget.url.toString().replaceAll("http://", "https://");
      }
    else{
      finalUrl = widget.url;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Kuliner Cirebon"),
      ),
      body: Container(
        child: Webview(
          initialUrl: finalUrl,
          javascriptMode: JavaScriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            setState(() {
              controller.complete(webViewController);
            });
          },
        ),
      ),
    );
  }
  
  Webview({required String initialUrl, required JavaScriptMode javascriptMode, required Null Function(WebViewController webViewController) onWebViewCreated}) {}
}
