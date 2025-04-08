// add_product_screen.dart
import 'package:flutter/material.dart';
import 'main_screen.dart'; // Certifique-se que o extension está definido aqui

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => context.router.pop(), // Usando o extension
        child: const Text('Voltar'),
      ),
    );
  }
}