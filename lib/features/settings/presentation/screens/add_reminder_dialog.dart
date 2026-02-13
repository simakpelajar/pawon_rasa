import 'package:flutter/material.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_sizes.dart';
import 'package:pawon_rasa/shared/core/constant/app_strings.dart';

class AddReminderDialog extends StatefulWidget {
  final Function(String title, String description, String time) onAdd;
  final String? initialTitle;
  final String? initialDescription;
  final String? initialTime;
  final bool isEdit;

  const AddReminderDialog({
    super.key,
    required this.onAdd,
    this.initialTitle,
    this.initialDescription,
    this.initialTime,
    this.isEdit = false,
  });

  @override
  State<AddReminderDialog> createState() => _AddReminderDialogState();
}

class _AddReminderDialogState extends State<AddReminderDialog> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController timeController;
  static const List<String> _quickTimes = [
    '07:00',
    '12:00',
    '18:00',
    '20:00',
  ];

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.initialTitle ?? '');
    descriptionController =
        TextEditingController(text: widget.initialDescription ?? '');
    timeController = TextEditingController(text: widget.initialTime ?? '');
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    timeController.dispose();
    super.dispose();
  }

  Future<void> _selectTime() async {
    final parts = timeController.text.split(':');
    final initialHour = int.tryParse(parts[0]) ?? 11;
    final initialMinute = int.tryParse(parts.length > 1 ? parts[1] : '0') ?? 0;

    final timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: initialHour, minute: initialMinute),
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (dialogContext, child) {
        final baseTheme = Theme.of(dialogContext);
        return Theme(
          data: baseTheme.copyWith(
            colorScheme: baseTheme.colorScheme.copyWith(
              primary: AppColors.accent,
              secondary: AppColors.secondary,
              surface: AppColors.surfaceOf(dialogContext),
            ),
            timePickerTheme: baseTheme.timePickerTheme.copyWith(
              dialHandColor: AppColors.accent,
              dialBackgroundColor:
                  AppColors.surfaceVariantOf(dialogContext),
              hourMinuteTextColor: AppColors.accent,
              hourMinuteColor:
                  AppColors.surfaceVariantOf(dialogContext),
              dayPeriodColor: AppColors.surfaceVariantOf(dialogContext),
              dayPeriodTextColor: AppColors.textPrimaryOf(dialogContext),
              entryModeIconColor: AppColors.textSecondaryOf(dialogContext),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusL),
              ),
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );

    if (timeOfDay != null) {
      final formattedTime =
          '${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}';
      timeController.text = formattedTime;
      setState(() {});
    }
  }

  void _setQuickTime(String time) {
    timeController.text = time;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: AppSizes.paddingL,
          right: AppSizes.paddingL,
          top: AppSizes.paddingM,
          bottom: AppSizes.paddingL + MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: BoxDecoration(
          color: AppColors.backgroundOf(context),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSizes.radiusL),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: EdgeInsets.only(bottom: AppSizes.paddingM),
                  decoration: BoxDecoration(
                    color: AppColors.textSecondaryOf(context).withValues(
                      alpha: 120,
                    ),
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ),
              Text(
                widget.isEdit
                    ? AppStrings.editReminderTitle
                    : AppStrings.addReminderTitle,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: AppSizes.paddingM),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: AppStrings.reminderTitleLabel,
                  hintText: AppStrings.reminderTitleHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingM,
                    vertical: AppSizes.paddingS,
                  ),
                ),
              ),
              SizedBox(height: AppSizes.paddingM),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: AppStrings.descriptionLabel,
                  hintText: AppStrings.descriptionHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingM,
                    vertical: AppSizes.paddingS,
                  ),
                ),
              ),
              SizedBox(height: AppSizes.paddingM),
              InkWell(
                onTap: _selectTime,
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: AppStrings.timeLabel,
                    hintText: AppStrings.timeHint,
                    prefixIcon: const Icon(Icons.access_time),
                    suffixIcon: const Icon(Icons.edit),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingM,
                      vertical: AppSizes.paddingS,
                    ),
                  ),
                  child: Text(
                    timeController.text.isEmpty
                        ? AppStrings.timeHint
                        : timeController.text,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: timeController.text.isEmpty
                              ? AppColors.textSecondaryOf(context)
                              : null,
                        ),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.paddingS),
              Wrap(
                spacing: AppSizes.paddingS,
                runSpacing: AppSizes.paddingS,
                alignment: WrapAlignment.start,
                children: _quickTimes
                    .map(
                      (time) => ChoiceChip(
                        label: Text(time),
                        selected: timeController.text == time,
                        onSelected: (_) => _setQuickTime(time),
                        selectedColor: AppColors.accent,
                        backgroundColor:
                            AppColors.surfaceVariantOf(context),
                        labelStyle: TextStyle(
                          color: timeController.text == time
                              ? Colors.white
                              : AppColors.textSecondaryOf(context),
                          fontWeight: FontWeight.w600,
                        ),
                        side: BorderSide(
                          color: timeController.text == time
                              ? AppColors.accent
                              : AppColors.textSecondaryOf(context)
                                  .withValues(alpha: 80),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: AppSizes.paddingL),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(AppStrings.cancelButton),
                    ),
                  ),
                  SizedBox(width: AppSizes.paddingM),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      onPressed: () {
                        if (titleController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(AppStrings.titleEmptyError),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                          return;
                        }

                        widget.onAdd(
                          titleController.text,
                          descriptionController.text,
                          timeController.text,
                        );
                      },
                      child: Text(
                        widget.isEdit
                            ? AppStrings.updateButton
                            : AppStrings.addButton,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
