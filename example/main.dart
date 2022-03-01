import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ezform/ezform.dart';

class EzFormExample extends StatelessWidget {
  EzFormExample({Key? key}) : super(key: key);

  EzForm form = EzForm(
    inputs: {
      'name': EzFormInput(
        title: 'Name',
        value: 'Hari Singh',
        validator: (value) => true,
      ),
      'email': EzFormInput(
        title: 'Email',
        value: 'hsbijarniya@gmail.com',
        validator: (value) => true,
      ),
      'password': EzFormInput(
        type: 'password',
        title: 'Password',
        value: 'password',
        validator: (value) => true,
      ),
      'address': {
        'line': EzFormInput(
          title: 'Line',
          value: 'B97',
          validator: (value) => true,
        ),
        'city': EzFormInput(
          title: 'City',
          value: 'Jaipur',
          validator: (value) => true,
        ),
        'state': EzFormInput(
          title: 'State',
          value: 'Rajasthan',
          validator: (value) => true,
        ),
        'country': EzFormInput(
          title: 'Country',
          value: 'India',
          validator: (value) => true,
        ),
      }
    },
    values: {
      '_id': '',
      'image': '',
    },
    builder: (props) {
      return AppTextField(
        textFieldType: TextFieldType.NAME,
        // keyboardType: props.keyboardType,
        controller: props.controller,
        focus: props.focus,
        nextFocus: props.next?.focus,
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        form.build('name'),
        SizedBox(height: 16),
        form.build('email'),
        SizedBox(height: 16),
        form.build('mobile'),
        SizedBox(height: 16),
        Text('Address'),
        form.build('address.line'),
        SizedBox(height: 16),
        form.build('address.city'),
        SizedBox(height: 16),
        form.build('address.state'),
        SizedBox(height: 16),
        form.build('address.country'),
        SizedBox(height: 16),
        form.build('address.pincode'),
        SizedBox(height: 16),
        TextButton(
          child: Text('Upload image'),
          onPressed: () {
            form.values['image'] = '123';
            form.refreshValues();
          },
        ),
        TextButton(
          child: Text('Done'),
          onPressed: () {
            // jsonEncode(form.values)
          },
        )
      ],
    );
  }
}
