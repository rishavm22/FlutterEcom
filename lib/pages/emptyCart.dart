import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyCartPage extends StatelessWidget {
  const EmptyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 60),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/cartImage.jpg'),
                fit: BoxFit.fill),
          ),
        ),
        Text(
          'Cart Is Empty',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textSelectionTheme.selectionColor,
          ),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'Lets Shop Now !',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
