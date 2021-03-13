import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mcuapp/data/core/api_client.dart';
import 'package:mcuapp/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));

  getItInstance.registerLazySingleton<GetPopular>(() => GetTrending(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(() => GetTrending(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(() => GetTrending(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerFactory(
          () => MovieCarouselBloc(
              getTrending: getItInstance(),
          ),
  );
}

