import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_dashboard_event.dart';
part 'user_dashboard_state.dart';

class UserDashboardBloc extends Bloc<UserDashboardEvent, UserDashboardState> {
  UserDashboardBloc() : super(UserDashboardInitial()) {
    on<UserDashboardEvent>((event, emit) {
    });
  }
}
