import 'package:flutter/material.dart';
import 'style.dart';


class CustomKey extends StatelessWidget {
  final double size = 40;
  final String text;
  final dynamic function;

  const CustomKey({
    super.key,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: dark? Colors.blue: Colors.amber,
      //color: Colors.blue,
    
      margin: EdgeInsets.all(size / 15),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(size / 3)),
      elevation: size / 3,
      child: InkWell(
        onTap: function,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              text,
              style: customFontStyle(lobster: true),
            ),
          ),
        ),
      ),
    );
  }
}


class CustomCard extends StatelessWidget {
  

  final VoidCallback onClick;
  final String text;
  final Color? color;
  
  const CustomCard({
    super.key, 
    required this.onClick,
    required this.text,
    this.color}
    );

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Card(
      color: color,  
      margin: EdgeInsets.all(deviceWidth/150),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(deviceHeight/70),
      ),
      elevation: deviceWidth/50,
      child: InkWell(
        onTap: () => onClick(),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: customFontStyle(),
            ),
        ),
      ),
    );
  }
}
