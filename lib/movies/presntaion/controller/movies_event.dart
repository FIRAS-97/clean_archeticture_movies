import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  MoviesEvent();
  @override
  List<Object?> get props => [];
}

class GetNowPlayingEvent extends MoviesEvent {}

class GetPopularEvent extends MoviesEvent {}

class GetTopRatedEvent extends MoviesEvent {}
