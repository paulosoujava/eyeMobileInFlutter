import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_flutter/widgets/keyboard.dart';
import 'package:pit_slider_carousel/pit_slider_carousel.dart';

class Payment extends StatefulWidget {

  String type;
  String value;


  Payment(this.type, this.value);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  List<String> numbers = List<String>();
  DateTime today = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, right: 20),
                    child: Text(
                      "PAGAMENTO REALIZADO COM SUCESSO",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "din",
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/fundo.png"),
                    fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 500,
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.cover,
                          ),
                          Container(
                            margin:  EdgeInsets.only(left: 10, right: 5, top: 30),
                            child: Image.asset(
                              "assets/images/place.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin:  EdgeInsets.only(left: 15, right: 2, top: 10),
                            child: Text(
                              "Av. Jorge lacerda, 2956 Florianópolis SC",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontFamily: "tahoma"),
                            ),
                          ),
                          Container(
                            margin:  EdgeInsets.only(left: 15, right: 2, top: 50),
                            child: Text(
                              "R\$ ${widget.value}",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontFamily: "tahoma", fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin:  EdgeInsets.only(left: 15, right: 2, top: 10),
                            child: Text(
                              "${widget.type}",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontFamily: "tahoma"),
                            ),
                          ),

                          Container(
                            margin:  EdgeInsets.only(left: 15, right: 2, top: 50),
                            child: Text(
                              "${today.day} / ${today.month} / ${today.year} ${today.hour}:${today.minute}:${today.second}",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontFamily: "tahoma"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 120,
              height: 45,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: InkWell(
                child: Text(
                  "COMFIRMAR",
                  style: TextStyle(fontFamily: "din", color: Colors.white),
                ),
                onTap: (){
                  _alert(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _alert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ok'),
          content: const Text('Enviando para impressora'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
