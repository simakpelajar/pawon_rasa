/// Application string constants
class AppStrings {
  AppStrings._();

  // App
  static const String appName = 'Pawon Rasa';
  static const String appTagline = 'Discover Best Restaurants';

  // Home
  static const String homeTitle = 'Restaurant List';
  static const String searchHint = 'Search restaurants...';
  static const String emptyState = 'No restaurants found';
  static const String emptyStateDescription =
      'Try adjusting your search or check back later';

  // Detail
  static const String detailTitle = 'Restaurant Detail';
  static const String menuTitle = 'Menu';
  static const String foodsTitle = 'Foods';
  static const String drinksTitle = 'Drinks';
  static const String reviewsTitle = 'Customer Reviews';
  static const String addReviewTitle = 'Add Review';
  static const String addReviewButton = 'Add Review';

  // Form
  static const String nameLabel = 'Name';
  static const String nameHint = 'Enter your name';
  static const String reviewLabel = 'Review';
  static const String reviewHint = 'Write your review here...';
  static const String submitButton = 'Submit';
  static const String cancelButton = 'Cancel';

  // Error
  static const String errorTitle = 'Oops!';
  static const String errorGeneric = 'Something went wrong';
  static const String errorNetwork = 'Network connection error';
  static const String errorServer = 'Server error';
  static const String retryButton = 'Retry';

  // Validation
  static const String validationNameEmpty = 'Name cannot be empty';
  static const String validationNameTooShort =
      'Name must be at least 3 characters';
  static const String validationReviewEmpty = 'Review cannot be empty';
  static const String validationReviewTooShort =
      'Review must be at least 10 characters';

  // Success
  static const String reviewSubmitted = 'Review submitted successfully';

  // Home Screen
  static const String homeInitialMessage = 'Start searching your favorite restaurants!';
  static const String favoriteAdded = 'Added to favorites';
  static const String favoriteRemoved = 'Removed from favorites';

  // Favorites Screen
  static const String favoritesTitle = 'Favorites';
  static const String favoritesInitialMessage = 'Initialize...';
  static const String favoritesEmptyTitle = 'No Favorites Yet';
  static const String favoritesEmptyDescription = 'Start adding restaurants to your favorites!';
  static const String removeFromFavoritesTitle = 'Remove from Favorites?';
  static const String removedFromFavorites = 'removed from favorites';
  static const String removeButton = 'Remove';

  // Settings Screen
  static const String settingsTitle = 'Settings';
  static const String dailyRemindersTitle = 'Daily Reminders';
  static const String dailyRemindersDescription = 'Enable daily meal reminders';
    static const String testReminderButton = 'Test Reminder Now';
    static const String testReminderTitle = 'Test Reminder';
    static const String testReminderDescription = 'This is a test reminder';
    static const String testReminderSentMessage = 'Test reminder sent';
    static const String testReminderEnableFirstMessage =
            'Enable daily reminders to test';
  static const String yourRemindersLabel = 'Your Reminders';
  static const String noRemindersTitle = 'No Reminders Yet';
  static const String noRemindersDescription = 'Add your first reminder below';
  static const String addReminderTitle = 'Add Reminder';
  static const String editReminderTitle = 'Edit Reminder';
  static const String reminderTitleLabel = 'Reminder Title';
  static const String reminderTitleHint = 'e.g., Lunch Time';
  static const String descriptionLabel = 'Description';
  static const String descriptionHint = 'What should you do?';
  static const String timeLabel = 'Time';
  static const String timeHint = 'Select time';
  static const String addButton = 'Add';
  static const String updateButton = 'Update';
  static const String deleteReminderTitle = 'Delete Reminder?';
  static const String deleteConfirmMessage = 'Are you sure you want to delete';
  static const String deleteButton = 'Delete';
  static const String editButton = 'Edit';
  static const String reminderAddedMessage = 'Reminder added successfully';
  static const String reminderUpdatedMessage = 'Reminder updated successfully';
  static const String reminderDeletedMessage = 'Reminder deleted';
  static const String titleEmptyError = 'Please enter a title';

    // Default Daily Reminder
    static const String defaultReminderTitle = 'Makan siang';
    static const String defaultReminderDescription =
            'Saatnya makan siang. Jangan lupa makan ya!';
    static const String defaultReminderTime = '11:00';
}
