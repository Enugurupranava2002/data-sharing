import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:send_data_bw_pages/pages/MainPage.dart';
import 'package:send_data_bw_pages/store.dart';

class SecondaryPage extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  void sendDataToMainPage(BuildContext context) {
    String textToSend = textEditingController.text;
    Provider.of<Store>(context, listen: false)
        .updateSencondaryPageData(textToSend);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    final mainPageResponse =
        Provider.of<Store>(context, listen: false).mainPageData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Secondary Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    "Data Received: ",
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    mainPageResponse == null
                        ? "No Data Received yet :("
                        : mainPageResponse,
                    style: const TextStyle(fontSize: 15.0),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                sendDataToMainPage(context);
              },
              child: Text('Send to Main Page'),
            ),
          ],
        ),
      ),
    );
  }
}
