// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ForgotPasswordsShowButtonWidget extends StatelessWidget {
  const ForgotPasswordsShowButtonWidget({
    required this.btnicon,
    required this.btntitle,
    required this.btnsubtitle,
    required this.ontap,
    super.key,
  });
  final IconData btnicon;
  final String btntitle, btnsubtitle;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(
              btnicon,
              size: 60.0,
              color: Colors.black87,
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  btntitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  btnsubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
