import 'dart:developer';

import 'package:chnan/Cubits/cubit%20Material/material_states.dart';
import 'package:chnan/models/medicine_model.dart';
import 'package:chnan/services/medicine_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialCubit extends Cubit<MaterialStates> {
  MaterialCubit() : super(MaterialInitial());
  Future<void> fetchMaterials() async {
    emit(MaterialLoading());
    try {
      final materialsData = await MedicineService.fetchMedicines();

      log('المواد الخام: $materialsData');

      final filteredData =
          materialsData.where((element) {
            log('قيمة isdeleted للمادة: ${element['isdeleted']}');
            return element['isdeleted'] == false;
          }).toList();

      log('المواد بعد الفلترة: $filteredData');

      final materials =
          filteredData.map((e) => MedicineModel.fromJson(e)).toList();

      emit(MaterialSuccess(materials: materials));
    } catch (e) {
      emit(MaterialFailure(errorMessage: e.toString()));
    }
  }

  Future<void> addMaterial(MedicineModel material) async {
    try {
      await MedicineService.insertMedicine(material);

      await fetchMaterials();
    } catch (e) {
      emit(MaterialFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateMaterial(
    String id,
    Map<String, dynamic> updatedValues,
  ) async {
    try {
      await MedicineService.updateMedicine(id, updatedValues);
      await fetchMaterials();
    } catch (e) {
      emit(MaterialFailure(errorMessage: e.toString()));
    }
  }

  Future<void> deleteMaterial(String id) async {
    try {
      await MedicineService.deleteMedicine(id);
      await fetchMaterials();
    } catch (e) {
      emit(MaterialFailure(errorMessage: e.toString()));
    }
  }
}
