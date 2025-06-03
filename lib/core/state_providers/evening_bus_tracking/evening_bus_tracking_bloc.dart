import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'evening_bus_tracking_event.dart';
part 'evening_bus_tracking_state.dart';

class EveningBusTrackingBloc extends Bloc<EveningBusTrackingEvent, EveningBusTrackingState> {
  EveningBusTrackingBloc() : super(EveningBusTrackingInitial()) {
    on<EveningBusTrackingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
