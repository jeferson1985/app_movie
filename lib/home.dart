import 'package:flutter/material.dart';
import 'package:flutter_application_2/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getMovie(),
      builder: (context, AsyncSnapshot snapshot) {
        return ListView.builder(
          itemCount: snapshot.data['Search'].length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(6),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    // color: Colors.purple,
                    child: Card(
                      color: Colors.purple,
                      elevation: 30,
                      child: Stack(
                        children: [
                          Image.network(
                              snapshot.data['Search'][index]['Poster'] == "N/A" ? 'https://images.unsplash.com/photo-1594322436404-5a0526db4d13?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=829&q=80' : snapshot.data['Search'][index]['Poster'] ),
                          Positioned(
                              top: 10,
                              left: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                snapshot.data['Search'][index]['Title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              )),
                          Positioned(
                              top: 40,
                              left: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                'Movie',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    ));
  }
}
