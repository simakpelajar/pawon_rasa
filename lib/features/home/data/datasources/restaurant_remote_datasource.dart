import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/restaurant_list_response.dart';

part 'restaurant_remote_datasource.g.dart';

@RestApi()
abstract class RestaurantRemoteDatasource {
  factory RestaurantRemoteDatasource(Dio dio, {String baseUrl}) =
      _RestaurantRemoteDatasource;

  @GET('/list')
  Future<RestaurantListResponse> getRestaurants();

  @GET('/search')
  Future<RestaurantListResponse> searchRestaurants(@Query('q') String query);
}
