// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class MyTextField extends StatefulWidget {
//   @override
//   _MyTextFieldState createState() => _MyTextFieldState();
// }
//
// class _MyTextFieldState extends State<MyTextField> {
//   final FocusNode _focusNode = FocusNode();
//   TextEditingController _controller = TextEditingController();
//   final ValueNotifier<int> char = ValueNotifier<int>(97);
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(_handleFocusChange);
//     RawKeyboard.instance.addListener(_handleKeyPress);
//   }
//
//   @override
//   void dispose() {
//     _focusNode.removeListener(_handleFocusChange);
//     RawKeyboard.instance.removeListener(_handleKeyPress);
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _handleFocusChange() {
//     if (_focusNode.hasFocus) {
//       SystemChannels.textInput.invokeMethod('TextInput.hide');
//     }
//   }
//
//   void _handleKeyPress(RawKeyEvent event) {
//     if (_focusNode.hasFocus && event.runtimeType == RawKeyDownEvent) {
//       final String data = String.fromCharCode(event.logicalKey.keyId);
//       final TextEditingValue value = TextEditingValue(
//         text: _controller.text + data,
//         selection: TextSelection.collapsed(offset: _controller.text.length + 1),
//       );
//       _controller.value = value;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: _controller,
//       focusNode: _focusNode,
//       enabled: true,
//       showCursor: true,
//       onSubmitted: (value) {
//         if (value == String.fromCharCode(char.value)) {
//           char.value = char.value + 1;
//         }
//       },
//       decoration: const InputDecoration(
//         border: InputBorder.none,
//         hintText: 'Search',
//         icon: Icon(Icons.search),
//       ),
//     );
//   }
// }
