import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/my_button.dart';

/// Email verification screen shown after sign-up (and after login while the
/// email is still unverified). Firebase sends a verification link by email;
/// the user taps it, then confirms here.
class VerificationWidget extends StatefulWidget {
  const VerificationWidget({super.key});

  @override
  State<VerificationWidget> createState() => _VerificationWidgetState();
}

class _VerificationWidgetState extends State<VerificationWidget> {
  bool _checking = false;
  bool _resending = false;

  User? get _user => FirebaseAuth.instance.currentUser;

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  Future<void> _checkVerified() async {
    final user = _user;
    if (user == null) {
      Navigator.pushReplacementNamed(context, 'login');
      return;
    }
    setState(() => _checking = true);
    try {
      await user.reload();
      final verified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;
      if (!mounted) return;
      if (verified) {
        Navigator.pushNamedAndRemoveUntil(context, 'dashboard', (_) => false);
      } else {
        _showMessage(
            'Email not verified yet. Please open the link we sent you.',
            Colors.orange);
      }
    } catch (_) {
      if (mounted) _showMessage('Could not check status. Try again.', Colors.red);
    } finally {
      if (mounted) setState(() => _checking = false);
    }
  }

  Future<void> _resend() async {
    final user = _user;
    if (user == null) return;
    setState(() => _resending = true);
    try {
      await user.sendEmailVerification();
      if (mounted) _showMessage('Verification email sent again.', Colors.green);
    } on FirebaseAuthException catch (e) {
      final message = e.code == 'too-many-requests'
          ? 'Too many requests. Please wait a moment and try again.'
          : 'Could not send the email. Please try again.';
      if (mounted) _showMessage(message, Colors.red);
    } finally {
      if (mounted) setState(() => _resending = false);
    }
  }

  Future<void> _backToLogin() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, 'login', (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    final email = _user?.email ?? 'your email';
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 35),
          const Text(
            "Verification",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Color(0xff2e386b),
            ),
          ),
          const SizedBox(height: 20),
          const Icon(Icons.mark_email_unread_outlined,
              size: 90, color: Color(0xff2e386b)),
          const SizedBox(height: 20),
          Text(
            'We sent a verification link to\n$email\n\n'
            'Open the link, then tap "I\'ve verified my email".',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _checking
              ? const CircularProgressIndicator()
              : MyButton(
                  color: Colors.blue[800]!,
                  title: "I've verified my email",
                  onPressed: _checkVerified,
                ),
          _resending
              ? const Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(),
                )
              : TextButton(
                  onPressed: _resend,
                  child: const Text('Resend email'),
                ),
          TextButton(
            onPressed: _backToLogin,
            child: const Text('Back to login'),
          ),
        ],
      ),
    );
  }
}
