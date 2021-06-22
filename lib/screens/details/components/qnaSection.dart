import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_app/models/product.dart';
import 'package:flutter/material.dart';

class QnASection extends StatelessWidget {
  final Map<String, String> qna;
  final Product product;
  final int index;
  final Function onChanged;
  const QnASection(this.qna, this.product, this.index, this.onChanged,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      product.qna.removeAt(index);
                      FirebaseFirestore.instance
                          .collection('item')
                          .doc(product.id)
                          .update({'qna': product.qna});
                      onChanged(product);
                    }),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  'Q: ${qna['q']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  '${qna['a']} :A',
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
