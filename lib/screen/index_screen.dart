import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pink.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First row of containers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildItem(context, 'assets/images/tp.png', 'call', const Page1()),
                      _buildItem(context, 'assets/images/radio.png', 'Moosic', const Page2()),
                      _buildItem(context, 'assets/images/tv.png', 'Drama', const Page3()),
                    ],
                  ),
                  const SizedBox(height: 20), // Space between the rows
                  // Second row of containers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildItem(context, 'assets/images/game.png', 'Play Time !', const Page4()),
                      _buildItem(context, 'assets/images/read.png', 'Nerdy ?', const Page5()),
                      _buildItem(context, 'assets/images/eat.png', 'Yummy', const Page6()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to create a container with an image and text
  Widget _buildItem(BuildContext context, String imagePath, String text, Widget page) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 100,
        height: 140, // Adjusted height to prevent overflow
        child: Column(
          children: [
            Flexible(
              child: TextButton(
                onPressed: () {
                  // Navigate to the specified page when the container is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // Removes default padding from the button
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                    boxShadow: [
  BoxShadow(
    color: Colors.white.withOpacity(1), // Shadow color with transparency
    blurRadius: 50, // Increased blur to make the shadow more subtle and circular
    spreadRadius: 2, // Added spread to extend the shadow around the image
    offset: const Offset(0, 0), // Centered shadow for a circular effect
  ),
],

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15), // Apply the same border radius to the image
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle:  FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Example pages for navigation
class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('call')),
      body: const Center(child: Text('call me baby ')),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moosic')),
      body: const Center(child: Text('Just music')),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drama')),
      body: const Center(child: Text('I bring all the Drama-ma-ma-ma')),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Play Time !')),
      body: const Center(child: Text('1 + 1 = ?')),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nerdy ?')),
      body: const Center(child: Text('I love reading')),
    );
  }
}

class Page6 extends StatelessWidget {
  const Page6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yummy')),
      body: const Center(child: Text('sugar sugar rune!')),
    );
  }
}
