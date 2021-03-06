import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main(){
  runApp(MaterialApp(home: MyApp(),));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{
  int counter = 0;
  int f = 0;
  Color iconColorM = Colors.black;
  Color iconColorL = Colors.black;
  TextEditingController mtController = TextEditingController();
  TextEditingController kgController = TextEditingController();
  var mt = double.parse('0');
  var kg = double.parse('0');
  var res = double.parse('0');
  var end = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calcular IMC'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [ 
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Text(
                "Ingrese sus datos para calcular el IMC",
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              mainAxisAlignment: 
                MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                children: [
                  IconButton(
                    onPressed:(){
                     
                      setState(() {
                        
                      });
                      if(f==1){
                        f--;
                      }else{
                        iconColorL = Colors.blue;
                        iconColorM = Colors.black;
                        f++;
                      }
                      print('$counter');
                    },
                    icon: Icon(Icons.male, color: iconColorL),
                  ),
                   
                ],
                ),
                Column(
                children: [
                  IconButton(
                    onPressed:(){
                      
                      setState(() {
                        
                      });
                      if(f==1){
                        f--;
                      }else{
                        iconColorM = Colors.blue;
                        iconColorL = Colors.black;
                        f++;
                      }
                      print('$counter');
                    },
                    icon: Icon(Icons.female, color: iconColorM),
                  ),
                ],
                ),
                
              ],
            ),
            
            ListTile(
            
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                cursorColor: Colors.green,
                controller: mtController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  iconColor: Colors.green,
                  focusColor: Colors.green,
                  hoverColor: Colors.green,
                  prefixIconColor: Colors.green,
                  suffixIconColor: Colors.green,
                  labelText: 'Ingresa altura (Metros)',
                  hintText: 'Ingresa altura (Metros)',
                  hintStyle: TextStyle(color: Colors.green),
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  icon: Icon(
                          Icons.straighten,
                          color: Colors.green,
                        ),
                  ),
                ),
              ),
            ),
            ListTile(
            
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                cursorColor: Colors.green,
                controller: kgController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  iconColor: Colors.green,
                  focusColor: Colors.green,
                  hoverColor: Colors.green,
                  prefixIconColor: Colors.green,
                  suffixIconColor: Colors.green,
                  labelText: 'Ingresa peso (KG)',
                  hintText: 'Ingresa peso (KG)',
                  hintStyle: TextStyle(color: Colors.green),
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  icon: Icon(
                          Icons.line_weight,
                          color: Colors.green,
                        ),
                  ),
                ),
              ),
            ),
            
            RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Calcular',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      kg = double.parse(kgController.text);
                      mt = double.parse(mtController.text);
                      res = kg / (mt * mt);
                      end = res.toStringAsFixed(2);
                      print('Login Text Clicked');
                      print(res);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _buildPopupDialog(context),
                      );
                    }),
            ]),
          ),
            




          ],
        )
    );
  }
  Widget _buildPopupDialog(BuildContext context) {
  String endd = "Tu IMC es : "+ end;
  return new AlertDialog(
    title: const Text('Tu IMC '),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(endd),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: Text('Aceptar'),
      ),
    ],
  );
}
}
  
