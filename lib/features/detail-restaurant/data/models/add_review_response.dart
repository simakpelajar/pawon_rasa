import 'package:freezed_annotation/freezed_annotation.dart';
import 'restaurant_detail_model.dart';

part 'add_review_response.freezed.dart';
part 'add_review_response.g.dart';

@freezed
class AddReviewResponse with _$AddReviewResponse {
  const factory AddReviewResponse({
    required bool error,
    required String message,
    required List<CustomerReviewModel> customerReviews,
  }) = _AddReviewResponse;

  factory AddReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$AddReviewResponseFromJson(json);
}
