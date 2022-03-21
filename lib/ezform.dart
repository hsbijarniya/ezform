library ezform;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class EzFormInput {
  String title, value;
  String? type, hint;
  Function(String value)? validator;

  EzFormInput({
    required this.title,
    required this.value,
    this.type,
    this.hint,
    this.validator,
  });
}

class EzFormInputProps {
  FocusNode focus = FocusNode();
  EzFormInputProps? next;
  TextEditingController controller = TextEditingController();
}

// class EzForm {
//   Map _inputs = {};
//   Map values = {};
//   Widget Function(EzFormInputProps)? builder;

//   EzForm({
//     required Map inputs,
//     values,
//     this.builder,
//   }) {
//     // Map<String, EzFormInput>
//     // Map<String, String>
//     // Map<String, Map>
//     // Map<String, dynamic>
//     _inputs = inputs;

//     // Map<String, dynamic>
//     this.values =
//         values == null ? {} : (values is Map ? values : values.toMap());

//     _inputs.forEach((key, value) {
//       if (value is EzFormInput) {
//         values[key] = value.value;
//       } else if (value is Map) {
//         // todo process this map
//       }
//     });
//   }

//   refreshValues() {}

//   EzFormInputProps propsOf(String name) {
//     return EzFormInputProps();
//   }

//   Widget build(String name, [Widget Function(EzFormInputProps)? builder]) {
//     return Container();
//   }

//   List<Widget> buildAll([Widget Function(EzFormInputProps)? builder]) {
//     List<Widget> list = [];

//     _inputs.forEach((key, value) {
//       EzFormInputProps props = EzFormInputProps();
//       list.add(this.builder != null ? this.builder!(props) : builder!(props));
//     });

//     return list;
//   }
// }

class EzForm {
  Map values = {};

  EzForm({
    required Map inputs,
    Map? values,
  }) {
    this.values = deepMergeInputs(initInputs(inputs), values ?? {});
  }

  get json {
    return prepareInputs(values);
  }

  Map prepareInputs(Map inputs) {
    Map outputs = {};

    inputs.forEach((key, value) {
      if (value is TextEditingController) {
        outputs[key] = value.text;
        return;
      }

      if (value is Map) {
        outputs[key] = prepareInputs(value);

        return;
      }

      outputs[key] = value;
    });

    return outputs;
  }

  Map deepMergeInputs(Map inputA, Map inputB) {
    Map outputs = {};

    List keys = List<dynamic>.from(inputA.keys),
        keysB = List<dynamic>.from(inputB.keys);

    keys.addAll(keysB);

    for (var key in keys) {
      var valA = inputA.containsKey(key) ? inputA[key] : null,
          valB = inputB.containsKey(key) ? inputB[key] : null;

      if (valA is Map && valB is Map) {
        outputs[key] = deepMergeInputs(valA, valB);

        continue;
      }

      if (valA != null) outputs[key] = valA;
      if (valB != null) outputs[key] = valB;
    }

    return outputs;
  }

  Map initInputs(Map inputs) {
    Map outputs = {};

    inputs.forEach((key, value) {
      if (value is Map) {
        outputs[key] = initInputs(value);

        return;
      }

      outputs[key] = TextEditingController(text: value.toString());
    });

    return outputs;
  }
}
