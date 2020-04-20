import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      // theme: ThemeData(
      //   primaryColor: Color(0xFF121212),
      //   textTheme: TextTheme(
      //     title: TextStyle(fontSize: 24),
      //     subtitle: TextStyle(fontSize: 12)
      //   ),
      // ),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildTextTitle('Tocadas recentemente'),
                SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(0, 5, 15, 5),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      buildCircleContainer("Calvin Harris", "Calvin-Harris"),
                      buildContainer("Beatles", "beatles"),
                      buildContainer("Sertanejo", "sertanejo"),
                      buildContainer("Rock", "rock"),
                    ],
                  ),
                ),
                buildTextTitle('Estações recomendadas'),
                SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(0, 5, 15, 5),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      buildBiggerContainer("Summer hits", "sunset"),
                      buildBiggerContainer("All night", "party"),
                      buildBiggerContainer("Matheus e Kauan", "na-praia"),
                      buildBiggerContainer("Beatles", "beatles"),
                      buildBiggerContainer("Beatles", "beatles"),
                    ],
                  ),
                ),
                buildTextTitle('Paradas'),
                SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(0, 5, 15, 5),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      buildBiggerContainer("Relax musics", "hearing"),
                      buildBiggerContainer("Summer hits", "sunset"),
                      buildBiggerContainer("All night", "party"),
                      buildBiggerContainer("Matheus e Kauan", "na-praia"),
                    ],
                  ),
                ),
                buildTextTitle('Feito para você'),
                SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(0, 5, 15, 5),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      // buildBiggerContainer(),
                      // buildBiggerContainer(),
                      // buildBiggerContainer(),
                      // buildBiggerContainer(),
                      // buildBiggerContainer(),
                      // buildBiggerContainer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 50, right: 15),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xff282828),
                shape: BoxShape.rectangle,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Align(
                      child: Image(
                        image: AssetImage('images/na-praia.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Align(
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Imagina Eu - Ao Vivo",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            " ¤ Matheus e Kauan",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.favorite_border,
                            size: 28,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.play_arrow,
                            size: 30,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff282828),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            title: Text('Início'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            title: Text('Buscar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
            title: Text('Sua Biblioteca'),
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xffB5B5B5),
        // onTap: _onItemTapped,
      ),
    );
  }
}

Widget buildButton(Function f, bool cor) {
  return RaisedButton(
    onPressed: f,
    elevation: 0,
    color: cor == true ? Colors.amber : Colors.red,
    splashColor: cor == true ? Colors.amber : Colors.red,
    shape: CircleBorder(),
  );
}

Widget buildContainer(String subtitle, String imagem) {
  return Container(
    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.green,
          ),
          width: 100,
          height: 100,
          child: Image(
            image: AssetImage('images/$imagem.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            subtitle,
            style: TextStyle(color: Colors.white, fontFamily: 'HelveticaBold'),
          ),
        )
      ],
    ),
  );
}

Widget buildCircleContainer(String name, String imagem) {
  return Container(
    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
            image: DecorationImage(
              image: AssetImage('images/$imagem.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          width: 100,
          height: 100,
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontFamily: 'HelveticaBold'),
          ),
        )
      ],
    ),
  );
}

Widget buildTextTitle(String title) {
  return Container(
    margin: EdgeInsets.all(15),
    child: Text(
      title,
      style: TextStyle(
        fontFamily: 'HelveticaBold',
        color: Colors.white,
        fontSize: 23,
      ),
    ),
  );
}

Widget buildBiggerContainer(String subtitle, String imagem) {
  return Container(
    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.green,
          ),
          width: 150,
          height: 150,
          child: Image(
            image: AssetImage('images/$imagem.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            subtitle,
            style: TextStyle(
                color: Color(0xffB5B5B5), fontFamily: 'HelveticaNormal'),
          ),
        )
      ],
    ),
  );
}
// Flexible(
//   child: FutureBuilder(
//     future: DefaultAssetBundle.of(context)
//         .loadString('load_json/data.json'),
//     builder: (context, snapshot) {
//       //Decode Json
//       var myData = json.decode(snapshot.data.toString());

//       return ListView.builder(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             margin: EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.red,
//                   child: Text(myData[index]['title']),
//                 ),
//                 Container(
//                     child: Text(
//                   myData[index]['subtitle'],
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ))
//               ],
//             ),
//           );
//         },
//         itemCount: myData.length,
//       );
//     },
//   ),
// ),
