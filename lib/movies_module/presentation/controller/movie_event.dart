import 'package:equatable/equatable.dart';

  abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMovie extends MovieEvent {}

class GetPopularMovie extends MovieEvent {}

class GetTopRate extends MovieEvent {}
