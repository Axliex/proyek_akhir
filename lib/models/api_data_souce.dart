import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadCategory() {
    return BaseNetwork.get("fashioncategory.json");
  }
  Future<Map<String, dynamic>> loadProducts() {
    return BaseNetwork.get("fashionproducts.json");
  }
  Future<Map<String, dynamic>> loadProductsByCategory(String category) {
    switch (category) {
      case 'Bags':
        return BaseNetwork.get("bagsproducts.json");
      case 'T-Shirts':
        return BaseNetwork.get("tshirtproducts.json");
      case 'Jackets':
        return BaseNetwork.get("jacketsproducts.json");
      case 'Jerseys':
        return BaseNetwork.get("jerseysproducts.json");
      case 'Pants':
        return BaseNetwork.get("pantsproducts.json");
      case 'Shoes':
        return BaseNetwork.get("shoesproducts.json");
      default:
        throw Exception('Category not found');
    }
  }

}