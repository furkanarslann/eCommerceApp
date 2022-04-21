import 'package:http/http.dart' as http;
// http paketini import et(alias ekle) sonra bir future method içerisinde http.get request yolla 
class CategoryApi {
  static Future getCategories() async {
    return await http.get(Uri.parse('http://10.0.2.2:3000/categories')); 
  }
}
