import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class sharedpref extends StatefulWidget {
  @override
  State<sharedpref> createState() => _sharedprefState();
}

class _sharedprefState extends State<sharedpref> {
  TextEditingController controller=TextEditingController();
  late SharedPreferences pref;
  String? title='';
  bool isvisible=false;
  @override
  void initState(){
    super.initState();
    initializepref();
  }
  Future<void> initializepref() async{
    pref=await SharedPreferences.getInstance();
  }
  Future<void> save() async{
    pref.setString('text', controller.text);
    setState(() {
      controller.clear();
    });
  }
  Future<void> read() async{
    String? storedTitle=pref.getString('text');
    if(storedTitle!=null && storedTitle.isNotEmpty)
    setState(() {
      title=storedTitle;
      isvisible=true;
    });
  }
  Future<void> delete() async{
    pref.remove('text');
    title='';
    setState(() {
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shared Preferences Demo'),
        ),
        body: Padding(
        padding:EdgeInsets.all(12),
        child:Column(
        children:[TextFormField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:BorderSide(
                width:3,
                  color:Colors.blue),
              ),
            ),
          ),
          SizedBox(height:20),
          Row(
            children: [
              ElevatedButton(
                  onPressed:(){save();
                  },
                  child: Text('Save')),
              SizedBox(width:10),
              ElevatedButton(
                onPressed: (){
                  read();

                },
                child:Text('Read')),
              SizedBox(width:10),
              ElevatedButton(
                onPressed:(){
                  delete();},
                child:Text('Delete'),
              )
            ],
          ),
          SizedBox(height:20),
          Row(
            children: [
              Text('Saved Text:',
              style: TextStyle(
                fontSize: 20,
              ),),
              Visibility(
                visible: isvisible,
                child: Text('$title',
                  style: TextStyle(
                    fontSize: 20,
                  ),),),
            ],
          )
          ],

        ),
      ),
      );
  }
}
