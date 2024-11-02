// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppFirebaseAuthException implements Exception {
  final String code;

  AppFirebaseAuthException({
    required this.code,
  });

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'email-already-exists':
        return 'The email address is already associated with an account.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'The password is invalid for the given email.';
      case 'operation-not-allowed':
        return 'Operation is not allowed. Please enable the email/password sign-in method.';
      case 'user-disabled':
        return 'The user associated with this email has been disabled.';
      case 'too-many-requests':
        return 'Too many requests have been made to the operation. Please try again later.';
      case 'missing-phone-number':
        return 'The phone number is missing.';
      case 'invalid-phone-number':
        return 'The phone number is not valid.';
      case 'invalid-verification-code':
        return 'The verification code is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid.';
      case 'quota-exceeded':
        return 'The quota for the operation has been exceeded. Please try again later.';
      case 'session-expired':
        return 'The session has expired. Please sign in again.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
