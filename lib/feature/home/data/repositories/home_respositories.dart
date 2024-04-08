import 'package:babalomoda/core/error/exceptions.dart';
import 'package:babalomoda/core/error/failures.dart';
import 'package:babalomoda/feature/home/data/data_source/local_home_data_source.dart';
import 'package:babalomoda/feature/home/data/data_source/remote_home_data_source.dart';
import 'package:babalomoda/feature/home/data/model/top_story_model.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final _connectionChecker = InternetConnectionChecker();
final _remoteDataSource = HomeRemoteDataSource();
final _localDataSource = HomeLocalDataSource();

class HomeRepositories {
  Future<Either<Failure, List<TopStoryModel>>> getTopStories(
      {required String section}) async {
    if (await _connectionChecker.hasConnection) {
      try {
        final remoteStories =
            await _remoteDataSource.getAllStore(section: section);
        try {
          _localDataSource.cacheStories(remoteStories, section);
        } on EmptyCacheException catch (e) {
          return Left(EmptyCacheFailure(message: e.message));
        }
        return Right(remoteStories);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      } on EmptyServerListException catch (e) {
        return Left(EmptyServerListFailure(message: e.message));
      }
    } else {
      try {
        final localStories =
            await _localDataSource.getCachedStories(section: section);
        return Right(localStories);
      } on EmptyCacheException catch (e) {
        return Left(EmptyCacheFailure(message: e.message));
      }
    }
  }
}
