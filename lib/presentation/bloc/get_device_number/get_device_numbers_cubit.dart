import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whatsapp/domain/entities/contact_entity.dart';
import 'package:whatsapp/domain/usecases/get_device_numbers_usecase.dart';

part 'get_device_numbers_state.dart';

class GetDeviceNumbersCubit extends Cubit<GetDeviceNumbersState> {
  final GetDeviceNumberUseCase getDeviceNumberUseCase;

  GetDeviceNumbersCubit({required this.getDeviceNumberUseCase})
      : super(GetDeviceNumbersInitial());

  Future<void> getDeviceNumbers() async {
    try {
      final contactNumbers = await getDeviceNumberUseCase.call();
      emit(GetDeviceNumbersLoaded(contacts: contactNumbers));
    } catch (_) {
      emit(GetDeviceNumbersFailure());
    }
  }
}
