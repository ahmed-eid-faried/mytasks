// String? validator(String? val, String? type) {
//   if (val == "" || val == null) {
//     // Changed "&&" to "||" for correct validation
//     return "Please enter a value"; // Improved error message
//   }

//   if (type == "text" && (val == "")) {
//     // Changed "&&" to "||"
//     return "Please enter a value"; // Improved error message
//   }

//   if (type == "username" && !GetUtils.isUsername(val)) {
//     return "Please enter a correct username"; // Improved error message
//   }

//   if (type == "phone" && !GetUtils.isPhoneNumber(val)) {
//     return "Please enter a correct phone number"; // Improved error message
//   }

//   if (type == "email" && !GetUtils.isEmail(val)) {
//     return "Please enter a correct email"; // Improved error message
//   }

//   RegExp passwordRegex =
//       RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

//   if (type == "password" && !passwordRegex.hasMatch(val)) {
//     return 'Please enter at least one uppercase letter, lowercase letter, digit, special character, and more than 8 characters'; // Improved error message
//   }

//   return null; // Return null when validation passes
// }
