import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restapi/services/api_manager.dart';

import '../models/apimodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Resapi> _resModel;

  @override
  void initState() {
    _resModel = API().getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RestApi'),
      ),
      body: Container(
        child: FutureBuilder<Resapi>(
          future: _resModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  // snapshot.data.length
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    var article = snapshot.data.name;

                    return Container(
                      child: Center(child: Text(article)),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
