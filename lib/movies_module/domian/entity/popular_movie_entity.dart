import 'package:equatable/equatable.dart';

class PopularMovieEntity extends Equatable {
  final String backdrop_path;
  final String title;

  const PopularMovieEntity({required this.backdrop_path, required this.title});

  @override
  List<Object?> get props => [backdrop_path, title];
}
