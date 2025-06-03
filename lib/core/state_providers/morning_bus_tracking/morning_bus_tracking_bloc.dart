import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'morning_bus_tracking_event.dart';
part 'morning_bus_tracking_state.dart';

class MorningBusTrackingBloc extends Bloc<MorningBusTrackingEvent, MorningBusTrackingState> {
  MorningBusTrackingBloc() : super(MorningBusTrackingInitial()) {
    on<MorningBusTrackingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
