import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size screenSize = mediaQuery.size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    final EdgeInsets padding = mediaQuery.padding;
    final double devicePixelRatio = mediaQuery.devicePixelRatio;

    bool isSmallPhone = screenWidth < 375;
    bool isRegularPhone = screenWidth >= 375 && screenWidth < 414;
    bool isLargePhone = screenWidth >= 414 && screenWidth < 600;
    bool isTablet = screenWidth >= 600;

    bool isiPhone12 = screenWidth == 390 && screenHeight == 844;

    double getResponsiveWidth(double percentage) => screenWidth * percentage;
    double getResponsiveHeight(double percentage) => screenHeight * percentage;

    double titleFontSize = isSmallPhone
        ? 16
        : isRegularPhone
        ? 17
        : isLargePhone
        ? 18
        : 20;
    double subtitleFontSize = isSmallPhone
        ? 14
        : isRegularPhone
        ? 15
        : isLargePhone
        ? 16
        : 18;
    double bodyFontSize = isSmallPhone
        ? 12
        : isRegularPhone
        ? 13
        : isLargePhone
        ? 14
        : 16;
    double searchFontSize = isSmallPhone
        ? 13
        : isRegularPhone
        ? 14
        : isLargePhone
        ? 15
        : 16;

    double horizontalPadding = isSmallPhone
        ? 16
        : isRegularPhone
        ? 18
        : isLargePhone
        ? 20
        : 24;
    double verticalPadding = getResponsiveHeight(0.015);

    double avatarRadius = isSmallPhone
        ? 20
        : isRegularPhone
        ? 22
        : isLargePhone
        ? 25
        : 28;

    double gridAspectRatio = isSmallPhone
        ? 0.8
        : isRegularPhone
        ? 0.85
        : isLargePhone
        ? 0.9
        : 1.0;

    if (isiPhone12) {
      horizontalPadding = 16;
      gridAspectRatio = 0.82;
      titleFontSize = 17;
      subtitleFontSize = 15;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight - padding.top - padding.bottom,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getResponsiveHeight(0.08),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: avatarRadius,
                          backgroundImage: const AssetImage("assets/girl.jpg"),
                        ),
                        SizedBox(width: getResponsiveWidth(0.03)),
                        Expanded(
                          child: Text(
                            "Hi, Emmanuel",
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: getResponsiveHeight(0.02)),

                  SizedBox(
                    height: getResponsiveHeight(0.065),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: getResponsiveWidth(0.04),
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                  size: isSmallPhone ? 18 : 20,
                                ),
                                SizedBox(width: getResponsiveWidth(0.03)),
                                Expanded(
                                  child: Text(
                                    "Search quizzes...",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: searchFontSize,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: getResponsiveWidth(0.03)),
                        Container(
                          height: double.infinity,
                          width: getResponsiveHeight(0.065),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F4F4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.tune,
                            color: Colors.black,
                            size: isSmallPhone ? 16 : 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: getResponsiveHeight(0.035)),

                  SizedBox(
                    height: getResponsiveHeight(0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: subtitleFontSize,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/categories');
                          },
                          child: Text(
                            "See more",
                            style: TextStyle(
                              color: const Color(0xFFFE950B),
                              fontSize: bodyFontSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: getResponsiveHeight(0.02)),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double availableWidth = constraints.maxWidth;
                      double cardWidth = (availableWidth - 16) / 2;
                      double cardHeight = cardWidth / gridAspectRatio;
                      double totalGridHeight = cardHeight * 2 + 16;

                      return SizedBox(
                        height: totalGridHeight,
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: gridAspectRatio,
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
                          ],
                        ),
                      );
                    },
                  ),

                  SizedBox(height: getResponsiveHeight(0.03)),

                  SizedBox(
                    height: getResponsiveHeight(0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "Score History",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: subtitleFontSize,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/categories',
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: getResponsiveWidth(0.02),
                              vertical: getResponsiveHeight(0.005),
                            ),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'View all',
                            style: TextStyle(
                              color: const Color(0xFFFE950B),
                              fontWeight: FontWeight.bold,
                              fontSize: bodyFontSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: getResponsiveHeight(0.03)),

                  DottedBorder(
                    options: RectDottedBorderOptions(
                      color: Colors.grey,
                      dashPattern: [10, 5],
                      strokeWidth: 2,
                      padding: EdgeInsets.all(16),
                    ),
                    child: Container(
                      width: 300,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.file_copy, size: 40, color: Colors.grey),
                          SizedBox(height: 10),
                          Text(
                            'You have no scores recorded yet\nSelect a category and challenge\nyourself',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
