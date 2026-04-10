import 'package:flutter/material.dart';

class MineCell extends StatelessWidget 
{
  final int index;
  const MineCell
  ({
    Key? key,
    required this.index, // Parámetro obligatorio en el constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      decoration: BoxDecoration
      (
        color: const Color.fromARGB(255, 118, 190, 249),
        border: Border.all(color: Colors.black, width: 1.5),
      ),
    );
  }
}
