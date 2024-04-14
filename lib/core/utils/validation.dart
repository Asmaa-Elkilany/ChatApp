

class MyValidation{

  String? nameValidation(String? name){
    String namePattern = r"^[a-zA-Z0-9]{5,12}$";
    RegExp regexp = RegExp(namePattern);
    name = name?? ' ';
    return (regexp.hasMatch(name)? null:'Invalid Name');

  }

  String? phoneValidation(String? phone){
    String phonePattern = r"^[0-9]{11}$";
    RegExp regexp = RegExp(phonePattern);
    phone = phone?? ' ';
    return (regexp.hasMatch(phone)? null:'Invalid Phone Number');

  }

  String? emailValidation(String? email){
    String emailPattern = r"^([a-z\d\.-]+)@([a-z\d-]+)\.([a-z]{2,8})(\.[a-z]{2,8})?$";
    RegExp regexp = RegExp(emailPattern);
    email = email?? ' ';
    return (regexp.hasMatch(email)? null:'Invalid Email');

  }

  String? passwordValidation(String? password){
    String passwordPattern = r"^[\w@-]{8,20}$";
    RegExp regexp = RegExp(passwordPattern);
    password = password?? ' ';
    return (regexp.hasMatch(password)? null:'Try Strong Password');

  }

  String? slugValidation(String? slug){
    String slugPattern = r"^[a-z\d-]{8,20}$";
    RegExp regexp = RegExp(slugPattern);
    slug = slug?? ' ';
    return (regexp.hasMatch(slug)? null:'Invalid Slug');

  }

}