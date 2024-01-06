import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter8/core/consts/assets_consts.dart';

class LikedDetailView extends StatefulWidget {
  const LikedDetailView({super.key});

  @override
  State<LikedDetailView> createState() => _LikedDetailViewState();
}

class _LikedDetailViewState extends State<LikedDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AssetsConsts.carImage),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '23 000 \$',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.red),
                      Text('1M'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BMW M4 Coupe: A Two-Door',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: Text(
                        'Detailed description of the BMW M4 Coupe comes here...'
                        // Add the full description here
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
