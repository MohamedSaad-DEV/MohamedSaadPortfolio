import 'dart:convert';

import 'package:http/http.dart' as http;

abstract final class StoreIconService {
  static final Map<String, String> _cache = {};

  static Future<String?> resolveIconUrl({
    String? playStorePackageId,
    String? appStoreId,
  }) async {
    final cacheKey = '${playStorePackageId ?? ''}_${appStoreId ?? ''}';
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey];
    }

    if (appStoreId != null) {
      final appStoreIcon = await fetchAppStoreIcon(appStoreId);
      if (appStoreIcon != null) {
        _cache[cacheKey] = appStoreIcon;
        return appStoreIcon;
      }
    }

    if (playStorePackageId != null) {
      final playStoreIcon = await fetchPlayStoreIcon(playStorePackageId);
      if (playStoreIcon != null) {
        _cache[cacheKey] = playStoreIcon;
        return playStoreIcon;
      }
    }

    return null;
  }

  static Future<String?> fetchAppStoreIcon(String appStoreId) async {
    final cacheKey = 'ios_$appStoreId';
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey];
    }

    try {
      final response = await http.get(
        Uri.parse('https://itunes.apple.com/lookup?id=$appStoreId'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final results = data['results'] as List<dynamic>?;
        if (results != null && results.isNotEmpty) {
          final artwork = results.first['artworkUrl512'] as String?;
          if (artwork != null) {
            _cache[cacheKey] = artwork;
            return artwork;
          }
        }
      }
    } catch (_) {}
    return null;
  }

  static Future<String?> fetchPlayStoreIcon(String packageId) async {
    final cacheKey = 'play_$packageId';
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey];
    }

    try {
      final response = await http.get(
        Uri.parse(
          'https://play.google.com/store/apps/details?id=$packageId&hl=en',
        ),
        headers: const {'User-Agent': 'Mozilla/5.0'},
      );
      if (response.statusCode == 200) {
        final ogImage = RegExp(
          r'<meta\s+property="og:image"\s+content="([^"]+)"',
          caseSensitive: false,
        ).firstMatch(response.body);
        if (ogImage != null) {
          final url = ogImage.group(1)!;
          _cache[cacheKey] = url;
          return url;
        }
      }
    } catch (_) {}
    return null;
  }
}
