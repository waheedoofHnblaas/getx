class AppLinks {
  static const String serverLink = 'https://phpddd.000webhostapp.com/ecommerce';
  static const String getUsersLink = '$serverLink/auth/getusers.php';
//https://phpddd.000webhostapp.com/ecommerce/home.php
  // =============================Images=================================
  static const String imageLink = 'https://www.svgrepo.com/show/';
 // static const String getUsersLink = '$serverLink/auth/getusers.php';

  //========================    Auth    ===========================
  static const String signUpLink        = '$serverLink/auth/signup.php';
  static const String loginLink         = '$serverLink/auth/login.php';
  static const String verifiySignupLink = '$serverLink/auth/verfiycode.php';

  //========================    home    ===========================
  static const String categoriesLink         = '$serverLink/categories/view.php';
  static const String homeDataLink           = '$serverLink/home.php';

  //========================    curd Items    ===========================
  static const String addItemLink         = '$serverLink/items/add.php';
  static const String deleteItemLink         = '$serverLink/items/delete.php';

  //========================    Forget Password    ===========================
  static const String checkEmailLink        = '$serverLink/forgetpassword/checkemail.php';
  static const String verifiyForgetCodeLink = '$serverLink/forgetpassword/verifycode.php';
  static const String resetPasswordLink     = '$serverLink/forgetpassword/resetpassword.php';
}
