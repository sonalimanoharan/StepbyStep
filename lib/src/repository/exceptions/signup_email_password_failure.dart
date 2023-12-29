class Signupwithemailandpasswordfailure {
  final String messages;
  const Signupwithemailandpasswordfailure(
      [this.messages =
          "unknown error "]); //generative constructor- does not require return
  factory Signupwithemailandpasswordfailure.code(String code) {
    switch (code) {
      case 'weak-passsword':
        return const Signupwithemailandpasswordfailure(
            "plese enter a stronger password");
      case 'invalid-email':
        return const Signupwithemailandpasswordfailure("invalid email");
      case 'email-already-in-use':
        return const Signupwithemailandpasswordfailure("email already in use");
      case 'operation-not-allowed':
        return const Signupwithemailandpasswordfailure("operation not allowed");
      case 'user-disabled':
        return const Signupwithemailandpasswordfailure("user disabled");
      default:
        return const Signupwithemailandpasswordfailure();
    }
  }
}
