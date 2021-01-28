import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CollapsingList()),
      bottomNavigationBar: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/food.svg"),
                Text("FOOD",
                    style: const TextStyle(
                        color: const Color(0xffff0000),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 11.0),
                    textAlign: TextAlign.left)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/explore.svg"),
                Text("EXPLORE",
                    style: const TextStyle(
                        color: const Color(0xff95989a),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 11.0),
                    textAlign: TextAlign.left)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/deals.svg"),
                Text("ORDERS",
                    style: const TextStyle(
                        color: const Color(0xff95989a),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 11.0),
                    textAlign: TextAlign.left)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/orders.svg"),
                Text("DEALS",
                    style: const TextStyle(
                        color: const Color(0xff95989a),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 11.0),
                    textAlign: TextAlign.left)
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 36, right: 16),
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            color: Color(0xff47af30),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: Text("Track order",
              style: const TextStyle(
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatelessWidget {
  SliverPersistentHeader makeHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 100.0,
          maxHeight: 100.0,
          child: Material(
            elevation: 5,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xfff3f4f6),
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("What are you craving?",
                                    style: TextStyle(
                                      color: Color(0xff95989a),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: 0,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset(
                          "assets/images/harburger.svg",
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Est. delivery time: 35mins",
                            style: TextStyle(
                              color: Color(0xff95989a),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                        Text("Your first delivery is FREE!",
                            style: TextStyle(
                              color: Color(0xff95989a),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/time.svg"),
                        SizedBox(
                          width: 4,
                        ),
                        Text("Deliver now, to",
                            style: TextStyle(
                                color: const Color(0xff95989a),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left)
                      ],
                    ),
                    Row(
                      children: [
                        Text("53 Awolowo Road, Ikoyi",
                            style: const TextStyle(
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 17.0),
                            textAlign: TextAlign.left),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: const Color(0xffff0000),
                        )
                      ],
                    )
                  ],
                ),
                SvgPicture.asset("assets/images/profile.svg")
              ],
            ),
          ),
        ),
        makeHeader(),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 175.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 350,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl: "",
                        placeholder: (context, url) => Image.asset(
                          "assets/images/promotion_image.png",
                          fit: BoxFit.fill,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                            "assets/images/promotion_image.png",
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text("Featured",
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0),
                textAlign: TextAlign.left),
          ),
        ),
        SliverGrid(
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 1.6,
          ),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              constraints: BoxConstraints.expand(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: "",
                                  placeholder: (context, url) => Image.asset(
                                    "assets/images/promotion_image.png",
                                    fit: BoxFit.fill,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                          "assets/images/promotion_image.png",
                                          fit: BoxFit.fill),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/dummy.png",
                                    width: 42,
                                    height: 42,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Jollof & Co.",
                                            style: const TextStyle(
                                                color: const Color(0xff000000),
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 17.0),
                                            textAlign: TextAlign.left),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text("Delicious everyday Naija food",
                                            style: const TextStyle(
                                                color: const Color(0xff919191),
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0),
                                            textAlign: TextAlign.left),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text("Items as low as ₦500",
                                            style: const TextStyle(
                                                color: const Color(0xff919191),
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0),
                                            textAlign: TextAlign.left)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.keyboard_arrow_right_outlined,
                                        color: Color(0xffff0000),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
