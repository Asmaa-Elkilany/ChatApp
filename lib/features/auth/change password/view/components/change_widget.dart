import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/validation.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/my_button.dart';

/// Lets a signed-in user change their password.
/// Firebase requires a recent sign-in for this, so the user is
/// re-authenticated with their current password first.
class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({super.key});

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _loading = false;
  bool _hideCurrent = true;
  bool _hidePassword = true;
  bool _hideConfirm = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateConfirm(String? value) {
    if (value != _passwordController.text) return 'Passwords do not match';
    return null;
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  Future<void> _changePassword() async {
    if (!_formKey.currentState!.validate()) return;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null || user.email == null) {
      _showMessage('Please log in first.', Colors.red);
      Navigator.pushReplacementNamed(context, 'login');
      return;
    }

    setState(() => _loading = true);
    try {
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: _currentPasswordController.text,
      );
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(_passwordController.text);
      if (!mounted) return;
      _showMessage('Password changed successfully.', Colors.green);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'wrong-password':
        case 'invalid-credential':
          message = 'Your current password is incorrect.';
          break;
        case 'weak-password':
          message = 'The new password is too weak.';
          break;
        case 'too-many-requests':
          message = 'Too many attempts. Please try again later.';
          break;
        default:
          message = 'An error occurred. Please try again.';
      }
      if (mounted) _showMessage(message, Colors.red);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Widget _eye(bool hidden, VoidCallback onTap) => IconButton(
        onPressed: onTap,
        icon: Icon(hidden ? CupertinoIcons.eye_slash : CupertinoIcons.eye),
        color: const Color(0xff2e386b),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 35),
            const Text(
              "Change Password",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Color(0xff2e386b),
              ),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              hintText: 'Current Password',
              obscureText: _hideCurrent,
              controller: _currentPasswordController,
              suffixIcon: _eye(_hideCurrent,
                  () => setState(() => _hideCurrent = !_hideCurrent)),
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Enter your current password' : null,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              hintText: 'New Password',
              obscureText: _hidePassword,
              controller: _passwordController,
              suffixIcon: _eye(_hidePassword,
                  () => setState(() => _hidePassword = !_hidePassword)),
              validator: MyValidation().passwordValidation,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              hintText: 'Confirm New Password',
              obscureText: _hideConfirm,
              controller: _confirmPasswordController,
              suffixIcon: _eye(_hideConfirm,
                  () => setState(() => _hideConfirm = !_hideConfirm)),
              validator: _validateConfirm,
            ),
            const SizedBox(height: 20),
            _loading
                ? const CircularProgressIndicator()
                : MyButton(
                    color: Colors.blue[800]!,
                    title: "Change Password",
                    onPressed: _changePassword,
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
