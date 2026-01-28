import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pawon_rasa/features/home/data/datasources/restaurant_remote_datasource.dart';
import 'package:pawon_rasa/features/home/data/mappers/restaurant_mapper.dart';
import 'package:pawon_rasa/features/home/domain/entities/restaurant_entity.dart';
import 'package:pawon_rasa/features/home/domain/repositories/restaurant_repository.dart';
import 'package:pawon_rasa/shared/core/types/exception.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDatasource remoteDatasource;

  RestaurantRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<RestaurantEntity>>> getRestaurants() async {
    try {
      final response = await remoteDatasource.getRestaurants();

      if (response.error) {
        return Left(ServerFailure(response.message ?? 'Server error'));
      }

      return Right(RestaurantMapper.toEntityList(response.restaurants));
    } on DioException catch (e, st) {
      return Left(e.toFailure(stackTrace: st));
    } catch (e, st) {
      return Left(UnknownFailure(e, stackTrace: st));
    }
  }

  @override
  Future<Either<Failure, List<RestaurantEntity>>> searchRestaurants(
    String query,
  ) async {
    try {
      final response = await remoteDatasource.searchRestaurants(query);

      if (response.error) {
        return Left(ServerFailure(response.message ?? 'Server error'));
      }

      return Right(RestaurantMapper.toEntityList(response.restaurants));
    } on DioException catch (e, st) {
      return Left(e.toFailure(stackTrace: st));
    } catch (e, st) {
      return Left(UnknownFailure(e, stackTrace: st));
    }
  }
}
