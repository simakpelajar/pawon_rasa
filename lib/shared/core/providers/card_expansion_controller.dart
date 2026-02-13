import 'package:flutter/material.dart';

/// Global controller untuk mengelola expansion/collapse state dari restaurant cards
/// Digunakan di semua screen (Home, Favorites, dll) untuk konsistensi
/// Menggunakan Singleton pattern untuk share state di semua screen
class CardExpansionController extends ChangeNotifier {
  // Map untuk tracking expansion state per restaurant ID
  final Map<String, bool> _expandedCards = {};

  /// Check apakah card dalam keadaan expanded
  bool isExpanded(String cardId) {
    return _expandedCards[cardId] ?? false;
  }

  /// Toggle expand/collapse card
  void toggleExpansion(String cardId) {
    _expandedCards[cardId] = !(_expandedCards[cardId] ?? false);
    notifyListeners();
  }

  /// Set expansion state untuk specific card
  void setExpansion(String cardId, bool isExpanded) {
    _expandedCards[cardId] = isExpanded;
    notifyListeners();
  }

  /// Collapse semua cards
  void collapseAll() {
    _expandedCards.clear();
    notifyListeners();
  }

  /// Expand semua cards dengan IDs yang diberikan
  void expandAll(List<String> cardIds) {
    for (final id in cardIds) {
      _expandedCards[id] = true;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _expandedCards.clear();
    super.dispose();
  }
}
