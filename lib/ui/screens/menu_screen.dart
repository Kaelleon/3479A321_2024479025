import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget 
{
  const MenuScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text('Menu (Maqueta)')),
      body: const Center
      (
        child: Text('Aquí ira el menu'),
      ),
    );
  }
}