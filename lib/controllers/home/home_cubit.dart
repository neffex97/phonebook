import 'package:bloc/bloc.dart';
import 'package:phone_book/apps/app/app_repository.dart';
import 'package:phone_book/apps/helper/home_success_schema.dart';
import 'package:phone_book/apps/home/home_repository.dart';
import 'package:phone_book/apps/helper/status_error_handler_schema.dart';
import 'package:fpdart/fpdart.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required AppRepository appRepository,
  })  : _appRepository = appRepository,
        _homeRepository = appRepository.homeRepository,
        super(const HomeState());

  final AppRepository _appRepository;
  final HomeRepository _homeRepository;

  getData() async {
    Either<StatusErrorHandlerSchema, List<HomeSuccessSchema>> res =
        await _homeRepository.getUsersData(_appRepository);

    res.match(
        (left) => emit(state.copyWith(
            status: () => HomeStatus.error, message: () => left.message)),
        (right) => emit(state.copyWith(
            status: () => HomeStatus.success, data: () => right)));
  }
}
