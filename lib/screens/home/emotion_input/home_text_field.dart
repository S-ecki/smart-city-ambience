
import 'package:flutter/material.dart';

class HomeTextField extends StatelessWidget {
  const HomeTextField({
    Key key,
    @required FocusNode focusNode,
    @required TextEditingController controller,
  }) : _focusNode = focusNode, _controller = controller, super(key: key);

  final FocusNode _focusNode;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        focusNode: _focusNode,
        controller: _controller,
        maxLines: 2,
        decoration: InputDecoration(
          hintText: "Verbalisiere deine heutigen Gefühle",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}