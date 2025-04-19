import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tugas_3_mobile/models/situsmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoriteWeb extends StatefulWidget {
  final List<WebsiteModel> favoritList;
  final Function(WebsiteModel) onUpdate;

  const FavoriteWeb({
    super.key,
    required this.favoritList,
    required this.onUpdate,
  });

  @override
  State<FavoriteWeb> createState() => _FavoriteWebState();
}

class _FavoriteWebState extends State<FavoriteWeb> {
  @override
  Widget build(BuildContext context) {
    // hanya ambil situs favorit
    List<WebsiteModel> favoriteWebsites = dummyWebsites.where((w) => w.isFavorite).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text("Situs Favorit", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: favoriteWebsites.isEmpty
          ? const Center(
              child: Text("Belum ada situs favorit", style: TextStyle(fontSize: 16)),
            )
          : ListView.builder(
              itemCount: favoriteWebsites.length,
              itemBuilder: (context, index) {
                final item = favoriteWebsites[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => _launchURL(item.url),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl: item.image,
                                  width: 100,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const SizedBox(
                                    width: 100,
                                    height: 120,
                                    child: Center(child: CircularProgressIndicator()),
                                  ),
                                  errorWidget: (context, url, error) => const SizedBox(
                                    width: 100,
                                    height: 120,
                                    child: Center(child: Icon(Icons.broken_image, color: Colors.grey)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.description,
                                    style: const TextStyle(fontSize: 14),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.favorite, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  item.isFavorite = false; // Hapus dari favorit
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
