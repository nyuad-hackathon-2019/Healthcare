import 'package:flutter/material.dart';
import 'package:medikate3/AllergyDetail.dart';

class AllergyCard extends StatelessWidget {
  AllergyDetail detail;
  AllergyCard(this.detail);
  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: 200,
      child:
      // child: Column(
      //   children: <Widget>[
      //     Container(
      //       width: MediaQuery.of(context).size.width,
      //       color: Colors.pinkAccent,
      //       child: Center(child: Text(detail.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),)),
          Column(
                children: detail.allergies
                    .map((al) => 
                           Container(
                            // width: 50,
                            height: 50,
                            child: Card(
                              
                              child: Center(
                            child: Text(al.name, style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold,))                          )),),
                        )
                    .toList()),
          // )
      //   ],
      // ),
    );
  }
}
