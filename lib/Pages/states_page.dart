import 'package:codigo6_whatsapp/Data/data_dummy.dart';
import 'package:flutter/material.dart';

class StatesPage extends StatelessWidget {
  DataDummy dataDummy = DataDummy();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataDummy.states.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Stack(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      dataDummy.states[index].image,
                    ),
                    fit: BoxFit.cover,
                  ),
                  //borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: dataDummy.states[index].publish ? 3 : 0,
                    color: Colors.indigo,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            dataDummy.states[index].name,
          ),
          subtitle: Text(
            dataDummy.states[index].datetime,
          ),
        );
      },
    );
  }
}
