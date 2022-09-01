// import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:ezform/ezform.dart';

// class EzFormExample extends StatelessWidget {
//   EzFormExample({Key? key}) : super(key: key);

//   EzForm form = EzForm(
//     inputs: {
//       'name': {
//         'title': 'Name',
//         'validator': (value) => true,
//       },
//       'email': {
//         'title': 'Email',
//         'validator': (value) => true,
//       },
//       'password': {
//         'type': 'password',
//         'title': 'Password',
//         'validator': (value) => true,
//       },
//       'address': {
//         'line': {
//           'title': 'Line',
//           'validator': (value) => true,
//         },
//         'city': {
//           'title': 'City',
//           'validator': (value) => true,
//         },
//         'state': {
//           'title': 'State',
//           'validator': (value) => true,
//         },
//         'country': {
//           'title': 'Country',
//           'validator': (value) => true,
//         },
//       }
//     },
//     values: {
//       '_id': '',
//       'image': '',
//     },
//     builder: (field) {
//       return AppTextField(
//         textFieldType: TextFieldType.NAME,
//         // keyboardType: field.keyboardType,
//         controller: field.controller,
//         focus: field.focus,
//         nextFocus: field.next?.focus,
//       );
//     },
//   );

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         form.build('name'),
//         SizedBox(height: 16),
//         form.build('email'),
//         SizedBox(height: 16),
//         form.build('mobile'),
//         SizedBox(height: 16),
//         Text('Address'),
//         form.build('address.line'),
//         SizedBox(height: 16),
//         form.build('address.city'),
//         SizedBox(height: 16),
//         form.build('address.state'),
//         SizedBox(height: 16),
//         form.build('address.country'),
//         SizedBox(height: 16),
//         form.build('address.pincode'),
//         SizedBox(height: 16),
//         TextButton(
//           child: Text('Upload image'),
//           onPressed: () {
//             form.values['image'] = '123';
//             form.refreshValues();
//           },
//         ),
//         TextButton(
//           child: Text('Done'),
//           onPressed: () {
//             // jsonEncode(form.values)
//           },
//         )
//       ],
//     );
//   }
// }
