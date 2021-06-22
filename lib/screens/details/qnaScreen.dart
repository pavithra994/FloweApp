import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_app/constants.dart';
import 'package:flower_app/models/product.dart';
import 'package:flower_app/screens/details/components/product_image.dart';
import 'package:flower_app/screens/details/components/qnaSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QnAScreen extends StatefulWidget {
  final Product product;
  QnAScreen(this.product, {Key key}) : super(key: key);

  @override
  _QnAScreenState createState() => _QnAScreenState();
}

class _QnAScreenState extends State<QnAScreen> {
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

  TextEditingController _question = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        bottom: false,
        child: Column(
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
              child: Center(
                child: Hero(
                  tag: '${widget.product.id}',
                  child: ProductPoster(
                    size: Size(size.width * 0.8, size.height * 0.8),
                    image: widget.product.image,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                // here we use our demo procuts list
                itemCount: widget.product.qna.length,
                itemBuilder: (context, index) =>
                    QnASection(widget.product.qna[index], widget.product, index,
                        (Product p) {
                  setState(() {
                    widget.product.qna = p.qna;
                  });
                }),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              color: Theme.of(context).primaryColor,
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _question,
                        decoration: InputDecoration(
                          labelText: 'Ask a question',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          counterStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        maxLength: 200,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'filed is Required';
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          var map = Map<String, String>();
                          map['q'] = _question.text;
                          map['a'] = "";
                          widget.product.qna.add(map);
                          FirebaseFirestore.instance
                              .collection('item')
                              .doc(widget.product.id)
                              .update({'qna': widget.product.qna});
                          _formKey.currentState.reset();
                          _question.clear();
                          setState(() {});
                        },
                        child: Text(
                          'Ask',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
