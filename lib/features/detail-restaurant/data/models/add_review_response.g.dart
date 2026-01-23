// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddReviewResponseImpl _$$AddReviewResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AddReviewResponseImpl(
  error: json['error'] as bool,
  message: json['message'] as String,
  customerReviews:
      (json['customerReviews'] as List<dynamic>)
          .map((e) => CustomerReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$AddReviewResponseImplToJson(
  _$AddReviewResponseImpl instance,
) => <String, dynamic>{
  'error': instance.error,
  'message': instance.message,
  'customerReviews': instance.customerReviews,
};
