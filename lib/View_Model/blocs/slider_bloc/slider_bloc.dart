import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(const SliderInitial(slideIndex: 0)) {
    on<SlideChangeEvent>((event, emit) {
      emit(SliderInitial(slideIndex: event.slideIndex));
    });
  }
}
