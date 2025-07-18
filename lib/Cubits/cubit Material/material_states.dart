import 'package:chnan/models/medicine_model.dart';

abstract class MaterialStates {}

class MaterialInitial extends MaterialStates {}

class MaterialLoading extends MaterialStates {}

class MaterialSuccess extends MaterialStates {
  final List<MedicineModel> materials;
  MaterialSuccess({required this.materials});
}

class MaterialFailure extends MaterialStates {
  final String errorMessage;
  MaterialFailure({required this.errorMessage});
}
