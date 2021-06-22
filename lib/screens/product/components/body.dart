import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flower_app/components/search_box.dart';
import 'package:flower_app/constants.dart';
import 'package:flower_app/models/product.dart';
import 'package:flower_app/screens/details/details_screen.dart';

import 'category_list.dart';
import 'product_card.dart';

class Body extends StatefulWidget {
  // Body({key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> products = [];
  void getProduct() {
    products.clear();
    FirebaseFirestore.instance
        .collection('item')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print("***");
        // print(doc.data());
        // print(doc.data()["image"]);
        // print(doc["id"]);
        var qna = (doc.data()["qna"] as List<dynamic>) ?? [];
        List<Map<String, String>> list = [];
        if (qna.length != 0) {
          qna.forEach((element) {
            Map<String, String> map = {};
            map['a'] = element['a'];
            map['q'] = element['q'];
            list.add(map);
          });
        }
        products.add(
          new Product(
              doc.id,
              doc.data()["type"],
              doc.data()["title"],
              doc.data()["description"],
              doc.data()["image"],
              doc.data()["likeCount"] ?? 0,
              list),
        );
        setState(() {});
      });
    });
  }

  @override
  void initState() {
    super.initState();

    this.setState(() {
      getProduct();
      print("***set state");
    });
  }

  @override
  Widget build(BuildContext context) {
    // this.setState(() {
    //   print("***");
    //   // products.clear();
    //   FirebaseFirestore.instance
    //       .collection('item')
    //       .get()
    //       .then((QuerySnapshot querySnapshot) {
    //     querySnapshot.docs.forEach((doc) {
    //       print("***");
    //       print(doc.data());
    //       print(doc.data()["image"]);
    //       // print(doc["id"]);
    //       products.add(new Product(
    //           doc.data()["id"],
    //           doc.data()["type"],
    //           doc.data()["title"],
    //           doc.data()["description"],
    //           doc.data()["image"]));
    //       print(products.length);
    //     });
    //   });
    // });
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          SearchBox(onChanged: (value) {}),
          CategoryList(),
          SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                ListView.builder(
                  // here we use our demo procuts list
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    product: products[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: products[index],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
