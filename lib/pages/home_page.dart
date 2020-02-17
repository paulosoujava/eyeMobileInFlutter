import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_flutter/pages/Payment.dart';
import 'package:payment_flutter/widgets/keyboard.dart';
import 'package:pit_slider_carousel/pit_slider_carousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  List<String> numbers = List<String>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [const Color(0xFFB74093), const Color(0xFFB74093)]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "R\$ ",
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                  fontFamily: 'din'
                              ),
                            ),
                            Text(
                              numbers.isEmpty ?
                              " 00,00" :
                              _getNumber(),
                              maxLines: 1,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 55,fontFamily: 'din', fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          "Total a pagar",
                          style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'din', ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            child: KeyBoard("1"),
                            onTap: (){
                              _update("1");
                            },
                          ),
                          InkWell(
                            child: KeyBoard("2"),
                            onTap: (){
                              _update("2");
                            },
                          ),
                          InkWell(
                            child: KeyBoard("3"),
                            onTap: (){
                              _update("3");
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            child: KeyBoard("4"),
                            onTap: (){
                              _update("4");
                            },
                          ),
                          InkWell(
                            child: KeyBoard("5"),
                            onTap: (){
                              _update("5");
                            },
                          ),
                          InkWell(
                            child: KeyBoard("6"),
                            onTap: (){
                              _update("6");
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            child: KeyBoard("7"),
                            onTap: (){
                              _update("7");
                            },
                          ),
                          InkWell(
                            child: KeyBoard("8"),
                            onTap: (){
                              _update("8");
                            },
                          ),
                          InkWell(
                            child: KeyBoard("9"),
                            onTap: (){
                              _update("9");
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 65,
                          ),
                          InkWell(
                            child: KeyBoard("0"),
                            onTap: (){
                              _update("0");
                            },
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                numbers.removeLast();
                              });
                            },
                              child: KeyBoard("_", isIcon: true)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                margin: EdgeInsets.only(left:20, top:20, right:20, bottom: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: PitSliderCarousel(
                      height: 170,
                      maxDotsIndicator: 2,
                      dotSize: 10.0,
                      activeDotColor: Colors.purple,
                      dotColor: Colors.grey,
                      useDot: true,
                      animationCurve: Curves.ease,
                      autoPlay: false,
                      dotPosition: Position(bottom: 40.0),
                      carouselController: _buildCarousel()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _update(String num){
    setState(() {
      numbers.add(num);
    });
  }
  
  _gotPage(String type){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Payment(type, _getNumber());
    }));
  }
  _buildCarousel() {
    List<CarouselItem> list = [];
    list.add(
      CarouselItem(
        Row(
          children: <Widget>[
            SizedBox(
              width: 35,
            ),
            InkWell(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 69,
                    child: Image.asset("assets/images/dinheir.png" ,height: 40, width: 50,fit: BoxFit.none,),
                  ),
                  Text(
                    "Dinheiro",
                    style: TextStyle(fontSize: 25,
                        fontFamily: 'Din',
                    ),
                  ),
                ],
              ),
                onTap:(){
                  _gotPage("Dinheiro");
                }
            ),
            SizedBox(
              width: 35,
            ),
            InkWell(

              child: Column(
                children: <Widget>[
                  Container(
                    height: 69,
                    child: Image.asset("assets/images/debito.png" ,height: 40, width: 50,fit: BoxFit.none,),
                  ),
                  Text(
                    "Débito",
                    style: TextStyle(fontSize: 25,    fontFamily: 'Din',),
                  ),
                ],
              ),
                onTap: (){
                  _gotPage("Débito");
                }
            ),
            SizedBox(
              width: 35,
            ),
            InkWell(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 69,
                    child: Image.asset("assets/images/cartao.png" ,height: 40, width: 50,fit: BoxFit.none,),
                  ),
                  Text(
                    "Crédito",
                    style: TextStyle(fontSize: 25,    fontFamily: 'Din',),
                  ),
                ],
              ),
                onTap: (){
                  _gotPage("Crédito");
                }
            ),
          ],
        ),
      ),
    );
    list.add(
      CarouselItem(
        Row(
          children: <Widget>[
            SizedBox(
              width: 35,
            ),
            InkWell(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 69,
                    child: Image.asset("assets/images/ve.png" ,height: 40, width: 50,fit: BoxFit.none,),
                  ),
                  Text(
                    "V.R.",
                    style: TextStyle(fontSize: 25,    fontFamily: 'Din',),
                  ),
                ],
              ),
                onTap: (){
                  _gotPage("V.R.");
                }
            ),
            SizedBox(
              width: 35,
            ),
            InkWell(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 69,
                    child: Image.asset("assets/images/cupom.png" ,height: 40, width: 50,fit: BoxFit.none,),
                  ),
                  Text(
                    "Cupom",
                    style: TextStyle(fontSize: 25,    fontFamily: 'Din',),
                  ),
                ],
              ),
                onTap: (){
                  _gotPage("Cupom");
                }
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );

    return CarouselController(carouselItems: list);
  }
  _getNumber() {
    String n;
    n = numbers.toString().replaceAll("[", "");
    n = n.toString().replaceAll("]", "");
    n = n.toString().replaceAll(",", "");
    n = n.toString().replaceAll(" ", "");
    return n;
  }
}
