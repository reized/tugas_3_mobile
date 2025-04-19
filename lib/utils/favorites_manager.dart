import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_3_mobile/models/situsmodel.dart';
import 'package:tugas_3_mobile/utils/session_manager.dart';

class FavoritesManager {
  static const String baseKeyFavorites = 'favorite_websites';

  // mendapatkan key favorit berdasarkan username
  static Future<String> _getUserFavoritesKey() async {
    String? username = await SessionManager.getUsername();
    return '${username}_$baseKeyFavorites';
  }

  // simpan id website favorit
  static Future<bool> saveFavorites(List<String> favoriteIds) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = await _getUserFavoritesKey();
    return await prefs.setStringList(key, favoriteIds);
  }

  // dapatkan id website favorit
  static Future<List<String>> getFavoriteIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = await _getUserFavoritesKey();
    return prefs.getStringList(key) ?? [];
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
  static Future<List<WebsiteModel>> loadFavoriteWebsites(
      List<WebsiteModel> allWebsites) async {
    List<String> favoriteIds = await getFavoriteIds();

    // update status favorit pada semua website
    for (var website in allWebsites) {
      website.isFavorite = favoriteIds.contains(website.id);
    }

    // filter website yang difavoritkan saja
    return allWebsites.where((website) => website.isFavorite).toList();
  }
}
