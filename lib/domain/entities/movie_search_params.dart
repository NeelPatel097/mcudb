import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class MovieSearchParams extends Equatable {
  final String searchTerm;

  MovieSearchParams({@required this.searchTerm});

  @override
  // TODO: implement props
  List<Object> get props => [searchTerm];
}