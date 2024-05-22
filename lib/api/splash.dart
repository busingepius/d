import 'dart:convert';

import 'package:d/errors/customError.dart';
import 'package:d/models/banner.dart';
import 'package:d/models/product.dart';
import 'package:http/http.dart' as http;

// final url = Uri.parse('https://gegabox.onrender.com/api/v1/banner');

// void main() async {
//   Future<Map<String, dynamic>> splash() async {
//     try {
//       var response = await http.get(url);
//       print(jsonDecode(response.body)["banners"].map((json)=>BannerAd.fromJson(json)).toList());
//       return jsonDecode(response.body);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
//   await splash();
// }

  Future<List<dynamic>> getProducts() async {
    final url = Uri.parse('https://gegabox.onrender.com/api/v1/product');
    try {
      var response = await http.get(url);
      return jsonDecode(response.body)["products"]
          .map((json) => Product.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<dynamic>> getBanners() async {
    final url = Uri.parse('https://gegabox.onrender.com/api/v1/banner');
    try {
      var response = await http.get(url);
      return jsonDecode(response.body)["banners"]
          .map((json) => BannerAd.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> getProductsAndBanner() async {
    try {
      List<dynamic> products = await getProducts();
      List<dynamic> banners = await getBanners();
      Map<String, List<dynamic>> productsAndBanners = {
        "banners": banners,
        "products": products,
      };
      return productsAndBanners;
    } catch (e) {
      throw Exception(e);
    }
  }

//   var val = await getProductsAndBanner();
//   print(val);
// // added here
// }
