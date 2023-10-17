import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:send_data_bw_pages/pages/SecondaryPage.dart';
import 'package:send_data_bw_pages/store.dart';

class MainPage extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();

  @override
  void sendDataToSecondaryPage(BuildContext context) {
    String textToSend = textEditingController.text;
    Provider.of<Store>(context, listen: false).updateMainPageData(textToSend);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SecondaryPage()));
  }

  @override
  Widget build(BuildContext context) {
    final secondaryPageResponse =
        Provider.of<Store>(context, listen: false).secondaryPageData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
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
                    secondaryPageResponse == null
                        ? "No Data Received yet :("
                        : secondaryPageResponse,
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
                sendDataToSecondaryPage(context);
              },
              child: Text('Send to Secondary Page'),
            ),
          ],
        ),
      ),
    );
  }
}
