import 'package:flutter/material.dart';

class ComPage extends StatelessWidget {
  final String colors;
  final String title;
  final List more;
  ComPage(this.colors, this.title, this.more);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            this.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              })),
      body: Giews(this.colors, this.title, this.more),
    );
  }
}

class Giews extends StatelessWidget {
  final String colors;
  final String title;
  final List more;
  Giews(this.colors, this.title, this.more);

  JumpPage(String isjump, String url) {
    print(isjump);
    print(url);
  }

  List<Widget> createWidget() {
    List<Widget> con = [];

    for (var i = 0; i < this.more.length; i++) {
      con.add(InkWell(
          onTap: () {
            JumpPage(this.more[i]["isJump"], this.more[i]["url"]);
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15.0, 0, 0.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  this.more[i]["img"],
                  width: 45.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  this.more[i]["title"],
                  style: TextStyle(fontSize: 12.0),
                )
              ],
            ),
          )));
    }
    return con;
  }

  Widget _WidgetBuild() {
    return GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 0.0,
        children: createWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //  height: 320.0,
        //color: Colors.green,
        width: double.infinity,
        child: _WidgetBuild());
  }
}
