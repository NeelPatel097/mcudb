import 'package:mcuapp/domain/entities/movie_entity.dart';
part of 'movie_carousel_bloc.dart';


@immutable
abstract class MovieCarouselState {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselError extends MovieCarouselState {}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEnitiy> movies;
  final int defauldIndex;

  const MovieCarouselLoaded({
    this.movies,
    this.defauldIndex = 0,
}): assert(defauldIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object> get props => [movies, defauldIndex];

}
