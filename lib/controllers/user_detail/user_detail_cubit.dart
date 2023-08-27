import 'package:bloc/bloc.dart';
import 'package:phone_book/apps/app/app_repository.dart';
import 'package:phone_book/apps/helper/home_success_schema.dart';
import 'package:phone_book/apps/home/home_repository.dart';
import 'package:phone_book/apps/helper/status_error_handler_schema.dart';
import 'package:fpdart/fpdart.dart';

part 'user_detail_state.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  UserDetailCubit({
    required AppRepository appRepository,
  })  : _appRepository = appRepository,
        _homeRepository = appRepository.homeRepository,
        super(const UserDetailState());

  final AppRepository _appRepository;
  final HomeRepository _homeRepository;

  getData(String id) async {
    Either<StatusErrorHandlerSchema, HomeSuccessSchema> res =
        await _homeRepository.getUserData(_appRepository, id);

    res.match(
        (left) => emit(state.copyWith(
            status: () => UserDetailStatus.error, message: () => left.message)),
        (right) => emit(state.copyWith(
            status: () => UserDetailStatus.success, data: () => right)));
  }
}
