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

class EzForm {
  Map _inputs = {};
  Map values = {};
  Widget Function(EzFormInputProps)? builder;

  EzForm({
    required Map inputs,
    values,
    this.builder,
  }) {
    // Map<String, EzFormInput>
    // Map<String, String>
    // Map<String, Map>
    // Map<String, dynamic>
    _inputs = inputs;

    // Map<String, dynamic>
    this.values =
        values == null ? {} : (values is Map ? values : values.toMap());

    _inputs.forEach((key, value) {
      if (value is EzFormInput) {
        values[key] = value.value;
      } else if (value is Map) {
        // todo process this map
      }
    });
  }

  refreshValues() {}

  EzFormInputProps propsOf(String name) {
    return EzFormInputProps();
  }

  Widget build(String name, [Widget Function(EzFormInputProps)? builder]) {
    return Container();
  }

  List<Widget> buildAll([Widget Function(EzFormInputProps)? builder]) {
    List<Widget> list = [];

    _inputs.forEach((key, value) {
      EzFormInputProps props = EzFormInputProps();
      list.add(this.builder != null ? this.builder!(props) : builder!(props));
    });

    return list;
  }
}
