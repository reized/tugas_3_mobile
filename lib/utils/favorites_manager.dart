import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_3_mobile/models/situsmodel.dart';

class FavoritesManager {
  static const String keyFavorites = 'favorite_websites';

  // simpan id website favorit
  static Future<bool> saveFavorites(List<String> favoriteIds) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList(keyFavorites, favoriteIds);
  }

  // dapatkan id website favorit
  static Future<List<String>> getFavoriteIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(keyFavorites) ?? [];
  }

  // menambahkan website ke favorit
  static Future<bool> addToFavorites(String websiteId) async {
    List<String> currentFavorites = await getFavoriteIds();
    if (!currentFavorites.contains(websiteId)) {
      currentFavorites.add(websiteId);
      return await saveFavorites(currentFavorites);
    }
    return true;
  }

  // menghapus website dari favorit
  static Future<bool> removeFromFavorites(String websiteId) async {
    List<String> currentFavorites = await getFavoriteIds();
    if (currentFavorites.contains(websiteId)) {
      currentFavorites.remove(websiteId);
      return await saveFavorites(currentFavorites);
    }
    return true;
  }

  // toggle status favorit website
  static Future<bool> toggleFavorite(String websiteId) async {
    List<String> currentFavorites = await getFavoriteIds();
    if (currentFavorites.contains(websiteId)) {
      return await removeFromFavorites(websiteId);
    } else {
      return await addToFavorites(websiteId);
    }
  }

  // mendapatkan daftar website yang difavoritkan
  static Future<List<WebsiteModel>> loadFavoriteWebsites(List<WebsiteModel> allWebsites) async {
    List<String> favoriteIds = await getFavoriteIds();
    
    // update status favorit pada semua website
    for (var website in allWebsites) {
      website.isFavorite = favoriteIds.contains(website.id);
    }
    
    // filter website yang difavoritkan saja
    return allWebsites.where((website) => website.isFavorite).toList();
  }
}