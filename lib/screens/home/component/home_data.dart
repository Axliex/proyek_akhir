import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyek/controllers/colorpalette.dart';
import 'package:proyek/models/product_model.dart';
import 'package:proyek/screens/home/component/product_item.dart';
import '../../../models/api_data_souce.dart';
import '../../../models/category_model.dart';
import 'category_item.dart';

class HomeCategoryData extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const HomeCategoryData({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  _HomeCategoryDataState createState() => _HomeCategoryDataState();
}

class _HomeCategoryDataState extends State<HomeCategoryData> {
  bool showAll = false;
  List<Products> allProducts = [];
  List<Products> filteredProducts = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterProducts);
  }

  void _filterProducts() {
    final query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredProducts = allProducts;
      } else {
        filteredProducts = allProducts.where((product) {
          return product.title?.toLowerCase().contains(query) ?? false;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFD746C),
      child: FutureBuilder(
        future: ApiDataSource.instance.loadCategory(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            Category categoryData = Category.fromJson(snapshot.data);
            return _getProduct(categoryData);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _getProduct(Category categoryData) {
    return FutureBuilder(
      future: ApiDataSource.instance.loadProducts(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          Product productsData = Product.fromJson(snapshot.data);
          allProducts = productsData.products ?? [];
          if (filteredProducts.isEmpty) {
            filteredProducts = allProducts;
          }
          return SingleChildScrollView(
            child: _buildSuccessSection(categoryData, productsData),
          );
        }
        return _buildLoadingSection();
      },
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

  Widget _buildSuccessSection(Category categoryData, Product productsData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorPallete.whiteColor,
            ),
          ),
        ),
        GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 0,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            CategoryItem(
              icon: Icons.snowshoeing_sharp,
              iconSize: 30,
              label: categoryData.categories![0].toUpperCase(),
              categoryName: categoryData.categories![0],
            ),
            CategoryItem(
              icon: Icons.sports_soccer,
              iconSize: 30,
              label: categoryData.categories![1].toUpperCase(),
              categoryName: categoryData.categories![1],
            ),
            CategoryItem(
              icon: Icons.shopping_bag_rounded,
              iconSize: 30,
              label: categoryData.categories![2].toUpperCase(),
              categoryName: categoryData.categories![2],
            ),
            CategoryItem(
              icon: Icons.checkroom,
              iconSize: 30,
              label: categoryData.categories![3].toUpperCase(),
              categoryName: categoryData.categories![3],
            ),
            CategoryItem(
              icon: Icons.fitness_center,
              iconSize: 30,
              label: categoryData.categories![4].toUpperCase(),
              categoryName: categoryData.categories![4],
            ),
            CategoryItem(
              icon: Icons.emoji_people,
              iconSize: 30,
              label: categoryData.categories![5].toUpperCase(),
              categoryName: categoryData.categories![5],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorPallete.whiteColor,
              prefixIcon: Icon(Icons.search, color: ColorPallete.accentColor),
              hintText: 'Search',
              hintStyle: TextStyle(color: ColorPallete.accentColor),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPallete.accentColor),
                borderRadius: BorderRadius.circular(30.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPallete.accentColor),
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPallete.accentColor),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorPallete.whiteColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    showAll = !showAll;
                  });
                },
                child: Text(
                  showAll ? 'Show Less' : 'Show All',
                  style: TextStyle(color: ColorPallete.whiteColor),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: ColorPallete.accentColor,
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
              ),
            ],
          ),
        ),
        _productItemBuilder(filteredProducts),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _productItemBuilder(List<Products> data) {
    return Builder(builder: (context) {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: showAll ? data.length : (data.length < 4 ? data.length : 4),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductItem(productData: data[index]),
          );
        },
      );
    });
  }
}
