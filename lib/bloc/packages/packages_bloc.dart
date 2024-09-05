import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/package_model.dart';
import '../../repository/packages_repository.dart';

part 'packages_event.dart';
part 'packages_state.dart';

class PackagesBloc extends Bloc<PackagesEvent, PackagesState> {
  final PackagesRepository repository;

  PackagesBloc(this.repository) : super(PackagesInitial()) {
    on<FetchPackages>((event, emit) async {
      emit(PackagesLoading());
      try {
        final packages = await repository.fetchPackages();
        emit(PackagesLoaded(packages));
      } catch (e) {
        emit(PackagesError(e.toString()));
      }
    });
  }
}
