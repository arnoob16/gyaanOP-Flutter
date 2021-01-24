import 'package:flutter/material.dart';
import 'package:flutter_app/gyaan.dart';
import 'package:url_launcher/url_launcher.dart';

class ListItem extends StatelessWidget {
  final Gyaan gyaan;
  ListItem(this.gyaan);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Container(
                height: 250,
                child: Image.network(
                  gyaan.imageUrl,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 12.0,
            ),
            Text(gyaan.headline,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  gyaan.author,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: TextStyle(fontSize: 16.0),
                ),
                GestureDetector(
                  child: Text(
                    "Read more...",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.blue,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.0),
                  ),
                  onTap: () {
                    _openGyaan(gyaan.url);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_openGyaan(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
