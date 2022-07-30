class ValidationMixins {
  String? validateName(String? value) {
    if (value != null && value.isEmpty) {
      return 'Nombre es requerido';
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value != null && value.isEmpty) {
      return 'Apellido es requerido';
    }
    return null;
  }

  String? validateDNI(String? value) {
    RegExp exp = RegExp(r'^\d{8}$');
    if (value != null && value.isEmpty) {
      return 'DNI es requerido';
    } else if (!exp.hasMatch(value!)) {
      return 'DNI no válido';
    }
    return null;
  }

  String? validateAddress(String? value) {
    if (value != null && value.length < 6) {
      return 'Dirección Incorrecta';
    }
    return null;
  }

  String? validatePhone(String? value) {
    RegExp exp = RegExp(r'^9\d{8}$');
    if (value != null && value.isEmpty) {
      return 'Teléfono es requerido';
    } else if (!exp.hasMatch(value!)) {
      return 'Teléfono no válido, debe empezar con 9';
    }
    return null;
  }

  String? validateEmail(String? value) {
    RegExp exp = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    if (value != null && value.isEmpty) {
      return 'Email es requerido';
    } else if (!exp.hasMatch(value!)) {
      return 'Email no válido';
    }
    return null;
  }

  String? validateDeatils(String? value) {
    if (value != null && value.isEmpty) {
      return 'Detalles es  Requerido';
    }
    return null;
  }

  String? validateUser(String? value) {
    if (value != null && value.isEmpty) {
      return 'Usuario es requerido';
    } else if (value != null && value.length < 4) {
      return 'Usuario Incorrect, debe tener más de 4 caracteres';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value != null && value.isEmpty) {
      return 'Contraseña es requerida';
    } else if (value != null && value.length < 6) {
      return 'Contraseña Inválida, debe tener más de 6 caracteres';
    }
    return null;
  }

  String? validateDate(String? value) {
    if (value != null && value.isEmpty) {
      return 'Fecha es requerida';
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value != null && value.isEmpty) {
      return 'Descripción es requerida';
    }
    return null;
  }

  String? validateNamePet(String? value) {
    if (value != null && value.isEmpty) {
      return 'Nombre mascota es requerido';
    }
    return null;
  }
}
