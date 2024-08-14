import 'package:dash/const/const.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                    height: 50,
                    width: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3)),
                        ]),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      child: Text("Flutter"),
                    )),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
                onTap: () {},
                child: Container(
                    height: 50,
                    width: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3)),
                        ]),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      child: Text("Flutter"),
                    ))),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                    height: 50,
                    width: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3)),
                        ]),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      child: Text("Flutter"),
                    )),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                    height: 50,
                    width: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3)),
                        ]),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      child: Text("Flutter"),
                    )),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                    height: 50,
                    width: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3)),
                        ]),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      child: Text("Flutter"),
                    )),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
                height: 50,
                width: 100,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: cardBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3)),
                    ]),
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  child: Text("Flutter"),
                )),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                    height: 50,
                    width: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3)),
                        ]),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      child: Text("Flutter"),
                    )),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
                height: 50,
                width: 100,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: cardBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3)),
                    ]),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(),
                )),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                    height: 50,
                    width: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3)),
                        ]),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      child: Text("Flutter"),
                    )),
              ))
        ]),
      ),
    );
  }
}
