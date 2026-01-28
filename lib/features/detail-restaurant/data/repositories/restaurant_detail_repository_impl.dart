import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pawon_rasa/features/detail-restaurant/data/datasources/restaurant_detail_remote_datasource.dart';
import 'package:pawon_rasa/features/detail-restaurant/data/mappers/restaurant_detail_mapper.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/entities/restaurant_detail_entity.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/repositories/restaurant_detail_repository.dart';
import 'package:pawon_rasa/shared/core/types/exception.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

class RestaurantDetailRepositoryImpl implements RestaurantDetailRepository {
  final RestaurantDetailRemoteDatasource remoteDatasource;

  RestaurantDetailRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, RestaurantDetailEntity>> getRestaurantDetail(
    String id,
  ) async {
    try {
      final response = await remoteDatasource.getRestaurantDetail(id);

      if (response.error) {
        return Left(ServerFailure(response.message));
      }

      return Right(RestaurantDetailMapper.toEntity(response.restaurant));
    } on DioException catch (e, st) {
      return Left(e.toFailure(stackTrace: st));
    } catch (e, st) {
      return Left(UnknownFailure(e, stackTrace: st));
    }
  }

  @override
  Future<Either<Failure, List<CustomerReviewEntity>>> addReview({
    required String id,
    required String name,
    required String review,
  }) async {
    try {
      final response = await remoteDatasource.addReview({
        'id': id,
        'name': name,
        'review': review,
      });

      if (response.error) {
        return Left(ServerFailure(response.message));
      }

      return Right(
        RestaurantDetailMapper.toCustomerReviewEntityList(
          response.customerReviews,
        ),
      );
    } on DioException catch (e, st) {
      return Left(e.toFailure(stackTrace: st));
    } catch (e, st) {
      return Left(UnknownFailure(e, stackTrace: st));
    }
  }
}
