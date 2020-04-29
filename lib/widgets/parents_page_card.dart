import 'package:flutter/material.dart';

class ParentsPageCard extends StatelessWidget {
  ParentsPageCard({
    this.birthDate,
    this.firstName,
    this.lastName,
    this.middleName,
    this.position,
    this.childrenCnt,
  });

  final String firstName;
  final String lastName;
  final String middleName;
  final String birthDate;
  final String position;
  final int childrenCnt;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Фамилия:"),
                Text(lastName),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Имя:"),
                Text(firstName),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Отчество:"),
                Text(middleName),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Дата рождения:"),
                Text(birthDate),
              ],
            ),
            position != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Должность:"),
                      Text(position),
                    ],
                  )
                : SizedBox(),
            childrenCnt != 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("К-во детей:"),
                      Text(childrenCnt.toString()),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
      elevation: 10.0,
    );
  }
}
