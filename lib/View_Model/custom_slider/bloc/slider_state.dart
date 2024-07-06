part of 'slider_bloc.dart';

@immutable
sealed class SliderState {
  final int slideIndex;
  const SliderState({required this.slideIndex});
}

@immutable
final class SliderInitial extends SliderState {
  const SliderInitial({required super.slideIndex});
}
