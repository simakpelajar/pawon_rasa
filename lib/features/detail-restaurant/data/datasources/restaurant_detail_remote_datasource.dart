import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/restaurant_detail_response.dart';
import '../models/add_review_response.dart';

part 'restaurant_detail_remote_datasource.g.dart';

@RestApi()
abstract class RestaurantDetailRemoteDatasource {
  factory RestaurantDetailRemoteDatasource(Dio dio, {String baseUrl}) =
      _RestaurantDetailRemoteDatasource;

  @GET('/detail/{id}')
  Future<RestaurantDetailResponse> getRestaurantDetail(
    @Path('id') String id,
  );

  @POST('/review')
  Future<AddReviewResponse> addReview(
    @Body() Map<String, String> body,
  );
}
