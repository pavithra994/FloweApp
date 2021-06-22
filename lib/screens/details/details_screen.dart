import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flower_app/constants.dart';
import 'package:flower_app/models/product.dart';

import 'components/body.dart';
import 'package:flower_app/main.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  delete(context,product) {
    print("hii");
    // DocumentReference document =
    //     FirebaseFirestore.instance.collection("item").doc(product);
    // document.delete().whenComplete(() => print("success"));
    Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
  }

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          delete(context,product);
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.delete,
          color: Colors.red,
          size: 32,
        ),
      ),
      body: Body(
        product: product,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
