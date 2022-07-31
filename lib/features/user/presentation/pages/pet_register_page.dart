import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:pets_world/components/submit_button.dart';
import 'package:pets_world/utils/custom_snackbar.dart';
import 'package:pets_world/utils/enums.dart';

import '../../../../components/date_input.dart';
import '../../../../components/dropdown_input.dart';
import '../../../../components/image_input_icon.dart';
import '../../../../components/space.dart';
import '../../../../components/text_area_input.dart';
import '../../../../components/text_input.dart';
import '../../../../mixin/validation_mixins.dart';
import '../../../../routes/route_names.dart';
import '../controllers/pet_register_controller.dart';

class PetRegisterPage extends GetView<PetRegisterController>
    with ValidationMixins {
  void _register() async {
    final result = await controller.registerPet();
    if (result) {
      customSnackbar('Éxito', 'Registro exitoso', CustomSnackbarType.success);
      Get.toNamed(RouteNames.dashboard);
    } else {
      customSnackbar('Error', 'Registro incorrecto', CustomSnackbarType.error);
    }
  }

  PetRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                addVerticalSpace(25),
                const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                        "Registra una mascota para que se pueda activar su búsqueda por la comunidad.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))),
                addVerticalSpace(15),
                const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                        "Recuerde que mientras más específica sea su descripción, más eficiente será la búsqueda.",
                        style: TextStyle(fontSize: 16))),
                addVerticalSpace(15),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextInput(
                          controller: controller.nameInputController,
                          hintText: "Nombre",
                          validator: validateNamePet,
                        ),
                        addVerticalSpace(30),
                        TextInput(
                          controller: controller.colorInputController,
                          hintText: "Color",
                          validator: validateNamePet,
                        ),
                        addVerticalSpace(30),
                        _dropdownInput(context, 'Sexo', controller.sexOptions,
                            const Icon(Icons.transgender), 'sexOptions'),
                        addVerticalSpace(30),
                        DateInput(
                            controller: controller.dateInputController,
                            hintText: "Fecha de nacimiento",
                            validator: validateDate,
                            keyboardType: TextInputType.datetime,
                            onSaved: (value) {
                              //  fechaValue = value;
                            }),
                        addVerticalSpace(30),
                        _dropdownInput(context, 'Raza', controller.raceOptions,
                            const Icon(Icons.pets), 'raceOptions'),
                        addVerticalSpace(30),
                        _dropdownInput(
                            context,
                            'Tamaño',
                            controller.sizeOptions,
                            const Icon(Icons.format_size),
                            'sizeOptions'),
                        addVerticalSpace(30),
                        TextAreaInput(
                          controller: controller.descriptionInputController,
                          hintText: "Descripción",
                          validator: validateLastName,
                          onSaved: (value) {
                            // colorValue = value;
                          },
                        ),
                        addVerticalSpace(30),
                        ImageInputIcon(
                          title: "Elegir imagen de la mascota",
                          icon: Icons.image_outlined,
                          onClicked: () => controller.pickImage(),
                        ),
                        addVerticalSpace(30),
                        Obx(
                          () => SizedBox(
                              child: controller.bytesData.value == null
                                  ? Image(
                                      image: AssetImage(controller.imagePath),
                                      width: 160,
                                      height: 160,
                                      fit: BoxFit.cover,
                                    )
                                  : ClipOval(
                                      child: Image.memory(
                                        controller.bytesData.value!,
                                        fit: BoxFit.cover,
                                        width: 160,
                                        height: 160,
                                      ),
                                    )),
                        ),
                        addVerticalSpace(30),
                        CustomSubmitButton(
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.formKey.currentState?.save();
                                _register();
                              }
                            },
                            text: "REGISTRAR"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned.fill(
            child: Obx(() => controller.register.value == LoadingState.loading
                ? Container(
                    color: Colors.black26,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink()),
          ),
        ],
      ),
    );
  }

  Widget _dropdownInput(BuildContext context, hint, List<String> items,
          Icon nameIcon, option) =>
      Obx(
        () => Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: DropDownInput(
            hint: hint,
            nameIcon: nameIcon,
            items: items.map((e) => DropdownItem(value: e, label: e)).toList(),
            onChanged: (String? value) =>
                controller.onChangeSelectOptions(option, value),
            selectedValue: controller.selectOptions[option],
          ),
        ),
      );
}
