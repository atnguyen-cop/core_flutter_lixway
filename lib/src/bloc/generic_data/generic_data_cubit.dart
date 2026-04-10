import 'generic_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_core_flutter/src/license/gun_core.dart';
import 'package:gun_core_flutter/src/usecase/usecase.dart';
class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());
  void getData<T>(UseCase useCase,{dynamic params}) async {
    GunCore.ensureLicensed();
    var returnedData = await useCase.call(params: params);
    returnedData.fold(
            (error){
          emit(
              FailureLoadData(errorMessage: error)
          );
        },
            (data){
          emit(
              DataLoaded<T>(data: data)
          );
        }
    );
  }
}