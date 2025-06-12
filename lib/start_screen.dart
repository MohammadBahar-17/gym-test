import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.start, {super.key});
  final void Function() start;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.6,
            child: Image.asset('assets/images/gym.png', width: 300),
          ),
          SizedBox(height: 80),
          Text(
            'Test your knowledge about GYM',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: start,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color.fromARGB(1, 195, 139, 28),
            ),
            icon: Icon(Icons.arrow_circle_right),
            label: Text('Start quiz', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
