import 'package:flutter/material.dart';
import 'package:proyek/controllers/colorpalette.dart';
import 'package:proyek/models/product_model.dart';
import 'package:proyek/screens/home/component/product_item.dart';

import '../../../models/api_data_souce.dart';

class ProductCategoryData extends StatelessWidget {
  final categoryName;
  const ProductCategoryData({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPallete.baseColor,
      child: FutureBuilder(
        future: ApiDataSource.instance.loadProductsByCategory(categoryName),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            Product productData = Product.fromJson(snapshot.data);
            return _buildSuccessSection(productData);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }



  Widget _buildErrorSection() {
    return Center(child: Text("Error"));
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(Product productsData) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Products on\t${categoryName.toUpperCase()}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.75,
            ),
            itemCount: productsData.products!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductItem(productData: productsData.products![index]),
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
