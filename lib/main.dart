import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_home_app/bloc/theme.bloc.dart';
import 'package:flutter_smart_home_app/configs/themes.dart';
import 'package:flutter_smart_home_app/curve-clipper.dart';

//nueva rama (nuevo branch)

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setPreferredOrientations(
//      [
//        DeviceOrientation.portraitUp,
//        DeviceOrientation.portraitDown,
//      ],
//    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo 2',
      home: SmartHome(),
    );
  }
}

Color color = Color(0xffff024a);
Color color2 = Color(0xfffa3629);
String img2 =
    "https://passivehouseplus.ie/media/k2/items/cache/fc5d9d8578a06f6d4c69c78df34d3f3a_XL.jpg?t=-62169984000";

class SmartHome extends StatefulWidget {
  const SmartHome({Key key}) : super(key: key);

  @override
  _SmartHomeState createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _heightAnimation;
  Animation<double> _iconSizeAnimation;

  @override
  void initState() {
    super.initState();
    themeBloc.changeTheme(Themes.smartHome);

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _heightAnimation = new Tween(
      begin: 0.0,
      end: 220.0,
    ).animate(
      new CurvedAnimation(
        curve: Curves.decelerate,
        parent: _controller,
      ),
    );

    _iconSizeAnimation = new Tween(
      begin: 10.0,
      end: 35.0,
    ).animate(
      new CurvedAnimation(
        curve: Curves.easeInOut,
        parent: _controller,
      ),
    );

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Container(
      height: media.height,
      width: media.width,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              width: media.width,
              height: media.height * 0.35,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffff1e39),
                    Color(0xffff4125),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            width: media.width,
            top: 65,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Good Morning Cristian",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 105,
              left: 25,
              right: 25,
            ),
            child: Container(
              height: 215,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffeff2f3),
                    offset: Offset(1, 5.0),
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  buildDashboardRow1(),
                  Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  buildDashboardRow2(),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 325),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "\nRutines",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 200,
                          child: ListView(
                            padding: const EdgeInsets.only(right: 20),
                            scrollDirection: Axis.horizontal,
                            // children: List.generate(4, (_) {
                            //   return Column(
                            //     children: <Widget>[
                            //       _buildRoutinesItem(media),
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       _buildRoutinesItem(media),
                            //     ],
                            //   );
                            // }),
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  _buildRoutinesItem(media),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  _buildRoutinesItem(media),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  _buildRoutinesItem(media),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  _buildRoutinesItem(media),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  _buildRoutinesItem(media),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  _buildRoutinesItem(media),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Rooms",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 200,
                          child: LayoutBuilder(
                            builder: (context,constraint){
                              return ListView(
                                padding: const EdgeInsets.only(right: 20,),
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  _buildRoomItem(constraint, media),
                                  _buildRoomItem(constraint, media),
                                  _buildRoomItem(constraint, media),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.only(top: 55,left: 20,right: 20,),
          //   child: SingleChildScrollView(
          //                 child: Column(
          //       children: <Widget>[
          // Container(
          //   alignment: Alignment.center,
          //   child: Text(
          //     "Good Morning Cristian",
          //     style: TextStyle(
          //       color: Colors.blueAccent,
          //       fontSize: 20,
          //     ),
          //   ),
          // ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Good Morning Cristian",
          //             style: TextStyle(
          //               color: Colors.blueAccent,
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // SingleChildScrollView(
          //   child: Column(
          //     children: <Widget>[
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //       Text("data"),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildRoomItem(BoxConstraints constraint, Size media) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: constraint.maxHeight*0.6,
            width: media.width*0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/room.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: Container(
              height: constraint.maxHeight,
              width: media.width*0.7,
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(left: 5,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Living Room",style: TextStyle(fontSize:15,fontWeight:FontWeight.w500),),
                      Text("21 °C",style: TextStyle(fontSize:15,fontWeight:FontWeight.w400,color: Colors.grey,),),
                    ],
                  ),),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/img6.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoutinesItem(Size media) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: media.width * .5,
          child: ListTile(
            title: Text("10 PM daily"),
            subtitle: Text("SureFeed pet"),
            trailing: CupertinoSwitch(
              onChanged: (bool value) {},
              value: true,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDashboardRow1() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/img4.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Front door",
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Looked",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 12,
                          padding: const EdgeInsets.all(1.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                              right: 7,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff0ed02d),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(
            width: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/img3.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Avg Temp",
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "21 °C",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "27 °C Outside",
                          style: TextStyle(
                            fontSize: 13.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDashboardRow2() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/img1.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Washer",
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "1:24",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Done 9:30 am",
                          style: TextStyle(
                            fontSize: 13.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(
            color: Colors.grey,
            width: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/img2.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Devices on",
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "4",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
