import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';

class WebViewPageInAppWebView extends StatefulWidget {
  @override
  _WebViewPageInAppWebViewState createState() =>
      _WebViewPageInAppWebViewState();
}

class _WebViewPageInAppWebViewState extends State<WebViewPageInAppWebView> {
  InAppWebViewController webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ខ្សាច់កណ្តាល"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.83,
        child: InAppWebView(
          initialUrl: "about:blank",
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
            debuggingEnabled: true,
          )),
          onWebViewCreated: (controller) async {
            webView = controller;
            loadString();
          },
        ),
      ),
    );
  }

  loadString() async {
    String str = "";
    var dataList = [
      "sk1",
      "sk2",
      "sk3",
      "sk4",
      "sk5",
      "sk6",
      "sk7",
      "sk8",
      "sk9",
      "sk10",
      "sk11",
      "sk12",
      "sk13",
      "sk14",
      "sk15",
      "sk16",
      "sk17",
      "sk18",
    ];
    var title = [
      "តាឯក",
      "កោះចូរ៉ាម",
      "ស្វាយរមៀត",
      "ព្រះប្រសប់",
      "ព្រែកតាមាក់",
      "រកាជន្លឹង",
      "ជ័យធំ",
      "ពុកឫស្សី",
      "សន្លុង",
      "ស៊ីធរ",
      "ព្រែកអំពិល",
      "វិហារសួគ៌",
      "កំពង់ចំលង",
      "បាក់ដាវ",
      "កោះឧកញ៉ាតី",
      "ព្រែកលួង",
      "ព្រែកតាកូវ",
      "ស្វាយជ្រំ"
    ];

    var vote = [
      58.8,
      23.2,
      98.0,
      78.8,
      88.8,
      56.6,
      67.7,
      89.9,
      99.7,
      88.8,
      67.7,
      89.8,
      76.7,
      76.7,
      77.8,
      76.7,
      56.8,
      97.7
    ];
    for (int i = 0; i < dataList.length; i++) {
      str +=
          "{'id':'${dataList[i]}', 'value': ${vote[i]}, 'title':'${title[i]}',},\n";
    }

    String datastr = " var data = [$str];\n";
    // String baseUrl =
    //     await rootBundle.loadString("assets/web/sach_kondal1.html");

    ///work file in assets pc
    // String url = "http://localhost:8080/assets/web/sach_kondal1.html";
    // webView.loadUrl(url: url);

    // webView.loadUrl(
    //   url: Uri.dataFromString(
    //     fullAddedData,
    //     mimeType: "text/html",
    //     encoding: Encoding.getByName("utf-8"),
    //   ).toString(),
    // );

    ///try in phone file
    Directory directory2 = await getExternalStorageDirectory();
    var file = File(
        "${directory2.path}/Android/data/com.nomad.nomad_travel/files/sach_kondal1.html");
    debugPrint(file.toString());

    ///read what inside
    String contents = await file.readAsString();

    if (contents.contains(datastr)) {
      file.writeAsString(contents);
    } else {
      /// Substring to insert data
      var startScript = contents.substring(0, 880);
      var endScript = contents.substring(881);
      var fullAddedData = startScript + datastr + endScript;

      ///write back with added data
      await file.writeAsString(fullAddedData);
    }

    String phoneUrl =
        "http://localhost:8080/${directory2.path}/Android/data/com.nomad.nomad_travel/files/sach_kondal1.html";
    debugPrint(phoneUrl);
    webView.loadUrl(url: phoneUrl);
  }
}
