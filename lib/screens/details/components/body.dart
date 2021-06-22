import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_app/screens/details/qnaScreen.dart';
import 'package:flutter/material.dart';
import 'package:flower_app/constants.dart';
import 'package:flower_app/models/product.dart';

import 'product_image.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: '${widget.product.id}',
                      child: ProductPoster(
                        size: size,
                        image: widget.product.image,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                    child: Text(
                      widget.product.description,
                      style: TextStyle(color: kTextLightColor, fontSize: 17),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QnAScreen(widget.product),
                      ),
                    ),
                    child: Text(
                      'Goto Q & A',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.thumb_up_alt_sharp,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              widget.product.likeCount =
                                  widget.product.likeCount + 1;
                              FirebaseFirestore.instance
                                  .collection('item')
                                  .doc(widget.product.id)
                                  .update({
                                'likeCount': widget.product.likeCount,
                              });
                              setState(() {});
                            }),
                        Text(
                          '${widget.product.likeCount}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
