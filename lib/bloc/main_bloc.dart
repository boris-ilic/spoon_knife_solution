import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoon_knife_solution/models/github_repository_model.dart';
import 'package:spoon_knife_solution/services/api_service.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  GithubRepositoryModel repository = GithubRepositoryModel();
  final GralhqlService _networkService = GralhqlService();

  MainBloc() : super(MainInitial()) {
    on<InitialLoadingEvent>(_initialEvent);
  }

  FutureOr<void> _initialEvent(MainEvent event, Emitter<MainState> emit) async {
    emit(LoadingState());

    repository = await _networkService.getGraphqlRepository();

    emit(LoadedGraphqlDataState(gqlRepository: repository));
    
  }
}
