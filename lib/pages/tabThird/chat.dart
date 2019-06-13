import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class chats extends StatelessWidget {
  final String name;
  chats(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            this.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16.0, color: Colors.white,fontFamily: "alm"),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
      ),
      body: SafeArea(child: chat()),
    );
  }
}

class chat extends StatefulWidget {
  @override
  _chatState createState() => _chatState();
}
const defaultUserName = "jaiou ";
class _chatState extends State<chat> with TickerProviderStateMixin {
  FocusNode blankNode = FocusNode();
  final List<Msg> _message = <Msg>[];
  final TextEditingController _textEditingController = TextEditingController();
  bool _isWriting = false;
  void _submitMsg(String txt){
    _textEditingController.clear();
    setState(() {
      _isWriting = false;
    });
    Msg msg = Msg(
      txt: txt,
      animationController: AnimationController(vsync: this,duration: Duration(milliseconds: 800)),
    );
    setState(() {
      _message.insert(0, msg);
    });
    msg.animationController.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    for(Msg msg in _message){
      msg.animationController.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(blankNode);
      },
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemBuilder: (_,int index) => _message[index],
              itemCount: _message.length,
              reverse: true,
              padding: EdgeInsets.all(6.0),
            ),
          ),
          Divider(height: 1.0,),
          Container(
            child: _buidComposer(),
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
          ),
        ],
      ),
    );
  }
  Widget _buidComposer(){
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 9.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textEditingController,
                onChanged: (String txt){
                  setState(() {
                    _isWriting = txt.length > 0;
                  });
                },
                onSubmitted: _submitMsg,
                decoration: InputDecoration.collapsed(hintText: "输入内容"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3.0),
              child: Theme.of(context).platform == TargetPlatform.iOS ? CupertinoButton(
                  child: Icon(Icons.send),
                  onPressed: _isWriting ? () => _submitMsg(_textEditingController.text):null
              ):IconButton(
                icon: Icon(Icons.message),
                onPressed: _isWriting ? ()=> _submitMsg(_textEditingController.text):null,
              ),
            ),
          ],
        ),
//        decoration: Theme.of(context).platform == TargetPlatform.iOS ? BoxDecoration(
//          border: Border(top: BorderSide(color: Colors.brown[200]))
//        ):null
      ),
    );
  }
}


class Msg extends StatelessWidget{
  final txt;
  final AnimationController animationController;
  Msg({this.txt,this.animationController});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizeTransition(
      sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.bounceInOut
      ),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 18.0),
              child: CircleAvatar(
                child: Text(defaultUserName[0]),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(defaultUserName,style: Theme.of(context).textTheme.subhead,),
                  Container(
                    margin: const EdgeInsets.only(top: 6.0),
                    child: Text(txt),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
