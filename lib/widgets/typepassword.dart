import 'package:flutter/material.dart';

class Typepassword extends StatefulWidget {
  final String title;
  final String hintText;
  final double width;
  final double height;
  final TextEditingController passwordController;

  const Typepassword({
    Key? key,
    required this.title,
    required this.hintText,
    required this.width,
    required this.height,
    required this.passwordController,
  }) : super(key: key);

  @override
  _TypepasswordState createState() => _TypepasswordState();
}

class _TypepasswordState extends State<Typepassword> {
  bool _obscurePassword = true;

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!_containsUppercase(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!_containsNumber(value)) {
      return 'Password must contain at least one number';
    }
    if (!_containsSpecialCharacter(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  bool _containsUppercase(String value) {
    final uppercaseRegex = RegExp(r'^(?=.*[A-Z])');
    return uppercaseRegex.hasMatch(value);
  }

  bool _containsNumber(String value) {
    final numberRegex = RegExp(r'^(?=.*\d)');
    return numberRegex.hasMatch(value);
  }

  bool _containsSpecialCharacter(String value) {
    final specialCharacterRegex = RegExp(r'^(?=.*[!@#\$&*~])');
    return specialCharacterRegex.hasMatch(value);
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
         left: widget.width * 0.02,
       right: widget.height * 0.02),
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: widget.passwordController,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                    obscureText: _obscurePassword,
                    validator: _validatePassword,
                    cursorColor: Colors.black,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
