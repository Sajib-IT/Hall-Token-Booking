import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.cyan,
            ),
            height: 300,
            width: 500,
            child: const Center(
                child: Text(
                    "Developed By-\n\nAshik Ahmed Sajib\nID-IT20037\n\nTanvir Ahmmed Sifat\nID-IT20026\nit20026@mbstu.ac.bd\n\nNusrat Jahan Richi\nID-IT20027\nit20027@mbstu.ac.bd"))),
      ),
    );
  }
}
