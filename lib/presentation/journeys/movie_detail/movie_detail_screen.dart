import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcuapp/common/constants/size_constants.dart';
import 'package:mcuapp/common/constants/translation_constants.dart';
import 'package:mcuapp/common/extensions/size_extensions.dart';
import 'package:mcuapp/common/extensions/string_extensions.dart';
import 'package:mcuapp/di/get_it.dart';
import 'package:mcuapp/presentation/blocs/cast/cast_cubit.dart';
import 'package:mcuapp/presentation/blocs/favorite/favorite_cubit.dart';
import 'package:mcuapp/presentation/blocs/movie_detail/movie_detail_cubit.dart';
import 'package:mcuapp/presentation/blocs/videos/videos_bloc.dart';
import 'package:mcuapp/presentation/journeys/movie_detail/big_poster.dart';
import 'package:mcuapp/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:mcuapp/presentation/journeys/movie_detail/videos_widget.dart';

import 'cast_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({
    Key key,
    @required this.movieDetailArguments,
  })  : assert(movieDetailArguments != null, 'arguments must not be null'),
        super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailCubit _movieDetailBloc;
  CastCubit _castBloc;
  VideosBloc _videosBloc;
  FavoriteCubit _favoriteBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailCubit>();
    _castBloc = _movieDetailBloc.castBloc;
    _videosBloc = _movieDetailBloc.videosBloc;
    _favoriteBloc = _movieDetailBloc.favoriteBloc;
    _movieDetailBloc.add(
      MovieDetailLoadEvent(
        widget.movieDetailArguments.movieId,
      ),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc?.close();
    _castBloc?.close();
    _videosBloc?.close();
    _favoriteBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _castBloc),
          BlocProvider.value(value: _videosBloc),
          BlocProvider.value(value: _favoriteBloc),
        ],
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      movie: movieDetail,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w,
                        vertical: Sizes.dimen_8.h,
                      ),
                      child: Text(
                        movieDetail.overview,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                      child: Text(
                        TranslationConstants.cast.t(context),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    CastWidget(),
                    VideosWidget(videosBloc: _videosBloc),
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return Container();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
