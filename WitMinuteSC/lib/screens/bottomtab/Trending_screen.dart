import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1234/comman/AppColors.dart';
import 'package:flutter_app1234/comman/appfont.dart';
import 'package:flutter_app1234/models/InterstedList.dart';
import 'package:flutter_app1234/models/TrendingList.dart';

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreen createState() => _TrendingScreen();
}

class _TrendingScreen extends State<TrendingScreen> {
  List<TrendingList> trendingList = List<TrendingList>();
  @override
  void initState() {
    // TODO: implement initState
    trendingList.add(TrendingList(
        "https://i.ibb.co/5RSsJgv/main-qimg-6019f398435c62d5315527ef59e8e6ab.png",
        "Devid mark",
        "January 8,2020"));
    trendingList.add(TrendingList(
        "https://i.ibb.co/5RSsJgv/main-qimg-6019f398435c62d5315527ef59e8e6ab.png",
        "Petey Cruiser",
        "February 1,2020"));
    trendingList.add(TrendingList(
        "https://i.ibb.co/5RSsJgv/main-qimg-6019f398435c62d5315527ef59e8e6ab.png",
        "Anna Mull",
        "February 15,2020"));
    trendingList.add(TrendingList(
        "https://i.ibb.co/5RSsJgv/main-qimg-6019f398435c62d5315527ef59e8e6ab.png",
        "Paige Turner",
        "March 5,2020"));
    trendingList.add(TrendingList(
        "https://i.ibb.co/5RSsJgv/main-qimg-6019f398435c62d5315527ef59e8e6ab.png",
        "Bob Frapples.",
        "April 10,2020"));
    trendingList.add(TrendingList(
        "https://i.ibb.co/5RSsJgv/main-qimg-6019f398435c62d5315527ef59e8e6ab.png",
        "Brock Lee",
        "April 20,2020"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SafeArea(
        child: Column(
        children: <Widget>[
            topSerachLayout(),
            Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Trending",
                  style: TextStyle(
                      fontFamily: AppFont.roboto,
                      fontSize: 30,
                      color: Colors.black),
                )),
            Expanded(child: _myListView(context))
          ],
        ),
      )
    );
  }

  Widget _myListView(BuildContext context) {
    return ListView.builder(
      //  physics:  NeverScrollableScrollPhysics(), //AlwaysScrollableScrollPhysics
      itemCount: trendingList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          title: rowLayout(trendingList[index]),
        );
      },
    );
  }

  Widget rowLayout(TrendingList trendingList) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                Container(
                    width: 50,
                    height: 50,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage(
                                "https://i.ibb.co/7CjZMnS/images-1.jpg")))),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            trendingList.user_name,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: AppFont.medium,
                                color: AppColors.text_light_gray),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("2.3M people currenly playing",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: AppFont.extraBold,
                                  color: AppColors.text_light_black))),
                    ],
                  ),
                )),
                Text("#1 ",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: AppFont.extraBold,
                        color: AppColors.gray)),
              ],
            )),
        centerImageView(),
        Container(
            margin: EdgeInsets.only(right: 25),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(trendingList.date,
                  style: TextStyle(
                      fontFamily: AppFont.medium,
                      fontSize: 16,
                      color: Colors.black)),
            ))
      ],
    ));
  }

  Widget centerImageView() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: 200,
              width: 300,
              alignment: Alignment.center,
              child: Image.network(
                  "https://i.ibb.co/5RSsJgv/main-qimg-6019f398435c62d5315527ef59e8e6ab.png",
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover),
            ),
            Container(
                height: 200,
                width: 300,
                alignment: Alignment.topCenter,
                child: Visibility(
                    visible: true,
                    child: Container(
                        child: Text(
                      "King of new york",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: AppFont.extraBold,
                      ),
                    )))),
            Container(
                height: 200,
                width: 300,
                padding: EdgeInsets.all(2),
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0, right: 0.0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: AppColors.yellow,
                    child: Text(
                      "Join",
                      style:
                          TextStyle(fontSize: 20, fontFamily: AppFont.medium),
                    ),
                    onPressed: () {},
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ))
          ],
        ));
  }

  Widget topSerachLayout() {
    return Container(
        height: 35,
        margin: EdgeInsets.only(top: 30, right: 5, left: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.yellow,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        width: Size.infinite.width,
        padding: EdgeInsets.only(left: 10),
        child: TextField(
          autocorrect: true,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.gray,
            ),
            hintStyle: TextStyle(color: AppColors.gray),
            filled: true,
            border: InputBorder.none,
            fillColor: Colors.transparent,
            /*    enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: AppColors.yellow, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.red),
              )*/
          ),
        ));
  }
}
