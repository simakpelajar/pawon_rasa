import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:pawon_rasa/features/settings/presentation/providers/settings_controller.dart';
import 'package:pawon_rasa/features/settings/presentation/screens/add_reminder_dialog.dart';
import 'package:pawon_rasa/features/settings/presentation/widgets/reminder_card.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_sizes.dart';
import 'package:pawon_rasa/shared/core/constant/app_strings.dart';
import 'package:pawon_rasa/shared/core/di/injection.dart';
import 'package:pawon_rasa/shared/widgets/index.dart';

class SettingsScreen extends HookWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => getIt<SettingsController>());

    useEffect(() {
      controller.loadSettings();
      return null;
    }, []);

    return ChangeNotifierProvider.value(
      value: controller,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.settingsTitle),
          backgroundColor: AppColors.primary,
          elevation: 0,
        ),
        backgroundColor: AppColors.backgroundOf(context),
        body: Consumer<SettingsController>(
          builder: (context, ctrl, _) {
            return ctrl.state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (reminders, isReminderEnabled) => _buildLoadedState(
                context,
                ctrl,
                reminders,
                isReminderEnabled,
              ),
              error: (failure) => ErrorStateWidget(
                failure: failure,
                onRetry: () => ctrl.loadSettings(),
              ),
            );
          },
        ),
        floatingActionButton: Consumer<SettingsController>(
          builder: (context, ctrl, _) {
            return ctrl.state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
              loaded: (_, __) => FloatingActionButton(
                onPressed: () => _showAddReminderDialog(context, ctrl),
                backgroundColor: AppColors.primary,
                child: const Icon(Icons.add),
              ),
              error: (_) => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadedState(
    BuildContext context,
    SettingsController controller,
    List<dynamic> reminders,
    bool isReminderEnabled,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildReminderToggle(context, controller, isReminderEnabled),
          SizedBox(height: AppSizes.paddingM),
          _buildReminderSection(
            context,
            controller,
            reminders,
            isReminderEnabled,
          ),
        ],
      ),
    );
  }

  Widget _buildReminderToggle(
    BuildContext context,
    SettingsController controller,
    bool isReminderEnabled,
  ) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.paddingM),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusM),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.paddingM,
            vertical: AppSizes.paddingS,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.dailyRemindersTitle,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        AppStrings.dailyRemindersDescription,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Switch(
                    value: isReminderEnabled,
                    activeColor: AppColors.primary,
                    onChanged: (_) => controller.toggleReminderEnabled(),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.paddingS),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: OutlinedButton.icon(
              //     onPressed: () async {
              //       final scheduled =
              //           await controller.scheduleTestReminderNow();

              //       if (!context.mounted) return;

              //       final message = scheduled
              //           ? AppStrings.testReminderSentMessage
              //           : AppStrings.testReminderEnableFirstMessage;
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(
              //           content: Text(message),
              //           duration: const Duration(seconds: 2),
              //         ),
              //       );
              //     },
              //     icon: const Icon(Icons.notifications_active),
              //     label: const Text(AppStrings.testReminderButton),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReminderSection(
    BuildContext context,
    SettingsController controller,
    List<dynamic> reminders,
    bool isReminderEnabled,
  ) {
    if (reminders.isNotEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingM,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${AppStrings.yourRemindersLabel} (${reminders.length})',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: AppSizes.paddingM),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: reminders.length,
              separatorBuilder: (_, __) =>
                  SizedBox(height: AppSizes.paddingM),
              itemBuilder: (context, index) {
                final reminder = reminders[index];
                return ReminderCard(
                  reminder: reminder,
                  onToggle: () =>
                      controller.toggleReminderStatus(reminder.id),
                  onEdit: () => _showEditReminderDialog(
                    context,
                    controller,
                    reminder,
                  ),
                  onDelete: () => _showDeleteConfirmation(
                    context,
                    controller,
                    reminder.id,
                    reminder.title,
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    if (!isReminderEnabled) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.all(AppSizes.paddingL),
      child: Column(
        children: [
          Icon(
            Icons.notifications_none,
            size: 80,
            color: AppColors.textSecondaryOf(context),
          ),
          SizedBox(height: AppSizes.paddingM),
          Text(
            'No Reminders Yet',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: AppSizes.paddingS),
          Text(
            'Add your first reminder below',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showAddReminderDialog(
    BuildContext context,
    SettingsController controller,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (dialogContext) => AddReminderDialog(
        onAdd: (title, description, time) async {
          final success = await controller.addReminder(
            title: title,
            description: description,
            time: time,
          );

          if (success && context.mounted) {
            Navigator.pop(dialogContext);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(AppStrings.reminderAddedMessage),
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
      ),
    );
  }

  void _showEditReminderDialog(
    BuildContext context,
    SettingsController controller,
    dynamic reminder,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (dialogContext) => AddReminderDialog(
        initialTitle: reminder.title,
        initialDescription: reminder.description,
        initialTime: reminder.time,
        isEdit: true,
        onAdd: (title, description, time) async {
          final success = await controller.updateReminder(
            id: reminder.id,
            title: title,
            description: description,
            time: time,
            isEnabled: reminder.isEnabled,
          );

          if (success && context.mounted) {
            Navigator.pop(dialogContext);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(AppStrings.reminderUpdatedMessage),
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
      ),
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    SettingsController controller,
    String reminderId,
    String reminderTitle,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.deleteReminderTitle),
        content: Text('${AppStrings.deleteConfirmMessage} "$reminderTitle"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(AppStrings.cancelButton),
          ),
          TextButton(
            onPressed: () async {
              final success = await controller.removeReminder(reminderId);
              if (success && context.mounted) {
                Navigator.pop(dialogContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(AppStrings.reminderDeletedMessage),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
            child: const Text(
              AppStrings.deleteButton,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
