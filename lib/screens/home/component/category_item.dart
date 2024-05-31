import 'package:flutter/material.dart';
import 'package:proyek/controllers/colorpalette.dart';
import '../product_by_category.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String categoryName;

  CategoryItem({required this.icon, required this.label, required this.categoryName, required int iconSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductByCategoryPage(categoryName: categoryName,)),
        );;
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorPallete.accentColor.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(16.0),
                color: ColorPallete.whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  size: 65,
                  color: ColorPallete.accentColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(color: ColorPallete.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
