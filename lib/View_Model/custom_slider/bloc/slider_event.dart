part of 'slider_bloc.dart';

@immutable
sealed class SliderEvent {}

@immutable
class SlideChangeEvent extends SliderEvent {
  final int slideIndex;
  SlideChangeEvent({required this.slideIndex});
}
