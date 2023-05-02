import 'package:flutter/material.dart';

class Favorite extends ChangeNotifier {
  Set<int> _favoriteIndicies = {};

  bool isFavorite(int index) => _favoriteIndicies.contains(index);

  void toggleFavorite(int index) {
    if (_favoriteIndicies.contains(index)) {
      _favoriteIndicies.remove(index);
    } else {
      _favoriteIndicies.add(index);
    }
    notifyListeners();
  }
}
