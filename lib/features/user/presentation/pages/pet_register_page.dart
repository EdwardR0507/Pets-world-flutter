import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

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
  PetRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
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
                        hintText: "Nombre",
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
                      _dropdownInput(context, 'Tamaño', controller.sizeOptions,
                          const Icon(Icons.format_size), 'sizeOptions'),
                      addVerticalSpace(30),
                      TextAreaInput(
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
                        onClicked: () => controller.pickImage2(),
                      ),
                      addVerticalSpace(30),
                      controller.pickedImage == null
                          ? Image(
                              image: AssetImage(controller.imagePath),
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            )
                          : kIsWeb
                              ? ClipOval(
                                  child: Image.memory(
                                    controller.webImage,
                                    fit: BoxFit.cover,
                                    width: 160,
                                    height: 160,
                                  ),
                                )
                              : ClipOval(
                                  child: Image.file(
                                    controller.pickedImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                      addVerticalSpace(30),
                      _submitButton()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
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

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (controller.formKey.currentState!.validate()) {
          controller.formKey.currentState?.save();

          //La imagen web se obtiene como bytes
          //print(webImage.toString());
          Get.toNamed(RouteNames.pet);
        }
      },
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFF6200EE),
          fixedSize: const Size(350, 36),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: const Text("Reportar"),
    );
  }
}
