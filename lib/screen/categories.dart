import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/card.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    int crossAxisCount = screenWidth > 600 ? 3 : 2;
    double crossAxisSpacing = screenWidth * 0.04;
    double mainAxisSpacing = screenHeight * 0.02;
    double horizontalPadding = screenWidth * 0.04;
    double verticalPadding = screenHeight * 0.02;

    double aspectRatio = screenWidth > 600
        ? 1.1
        : screenWidth > 390
        ? 1.0
        : 0.9;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Quiz Categories',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * 0.045,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GridView.count(
                physics: const AlwaysScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: mainAxisSpacing,
                childAspectRatio: aspectRatio,
                children: const [
                  CategoryCard(
                    title: "Mathematics",
                    imagePath: 'assets/maths.png',
                    color: Color(0xFFFE950B),
                  ),
                  CategoryCard(
                    title: "Sports",
                    imagePath: 'assets/sport.png',
                    color: Color(0xFFFE950B),
                  ),
                  CategoryCard(
                    title: "History",
                    imagePath: 'assets/book.png',
                    color: Color(0xFFFE950B),
                  ),
                  CategoryCard(
                    title: "Animals",
                    imagePath: 'assets/animal.png',
                    color: Color(0xFFFE950B),
                  ),
                  CategoryCard(
                    title: "Anime",
                    imagePath: 'assets/anime.png',
                    color: Color(0xFFFE950B),
                  ),
                  CategoryCard(
                    title: "Vehicle",
                    imagePath: 'assets/vehicle.png',
                    color: Color(0xFFFE950B),
                  ),
                  CategoryCard(
                    title: "Film",
                    imagePath: 'assets/film.png',
                    color: Color(0xFFFE950B),
                  ),
                  CategoryCard(
                    title: "Video Games",
                    imagePath: 'assets/game.png',
                    color: Color(0xFFFE950B),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
