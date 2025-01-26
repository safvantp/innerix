import 'package:shared_preferences/shared_preferences.dart';

class UserLocalData {
  static const String _userIdKey = 'user_id';
  static const String _emailKey = 'email';
  static const String _phoneNumberKey = 'phone_number';
  static const String _nameKey = 'name';

  Future<void> saveUserData(int userId, String email, String phoneNumber, String name) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(_userIdKey, userId);  
  prefs.setString(_emailKey, email);
  prefs.setString(_phoneNumberKey, phoneNumber);
  prefs.setString(_nameKey, name);
}


  Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt(_userIdKey);
    final email = prefs.getString(_emailKey);
    final phoneNumber = prefs.getString(_phoneNumberKey);
    final name = prefs.getString(_nameKey);

    if (userId != null && email != null && phoneNumber != null && name != null) {
      return {
        'user_id': userId,
        'email': email,
        'phone_number': phoneNumber,
        'name': name,
      };
    }
    return null; 
  }

  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_phoneNumberKey);
    await prefs.remove(_nameKey);
  }
}
