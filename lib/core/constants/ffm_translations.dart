import 'package:get/get.dart';

class FFMTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'null': '',
          'home_title': 'Home',
          'home_subtitle': 'subtitle',
          'home_button1': 'go to Login',
          'login_title': 'Login',
          'login_title_login': 'Login',
          'login_title_register': 'Register',
          'login_new_account': 'Does not have account?',
          'login_button': 'Login',
          'login_email': 'E-mail',
          'login_password': 'Password',
          'login_enter_email': 'Please enter a mail',
          'login_enter_password': 'Please enter a password',
          'loginform_email_format': 'Email not vaild',
          'register_email': 'E-mail',
          'register_password': 'Password',
          'register_button': 'Register',
          'register_login': 'Login',
          'register_enter_email': 'Please enter a mail',
          'register_enter_password': 'Please enter a password',
          'register_password_dont_match': 'Password does not match',
          'register_retype_password': 'Retype Password',
          'registerform_password_short':
              'Password needs to be at least 8 chars',
          'registerform_password_no_match': 'Password does not match',
          'login_controller_user_not_found': 'User not found or bad password',
          'login_controller_registration_error': 'Register error',
          'login_controller_ok': 'OK',
          'splash_view_text': 'Loading...',
        },
        'sv_SE': {
          'null': '',
          'home_title': 'Home',
          'home_subtitle': 'subtitle',
          'home_button1': 'gå till inloggning',
          'login_title': 'Login',
          'login_title_login': 'In loggning',
          'login_title_register': 'Registering',
          'login_new_account': 'Inget konto?',
          'login_button': 'Logga in',
          'login_email': 'E-mail',
          'login_password': 'Lösenord',
          'login_enter_email': 'Ange en mail adress',
          'login_enter_password': 'Ange lösenord',
          'loginform_email_format': 'Mail stämmer inte',
          'register_button': 'Registrera',
          'register_login': 'Logga in',
          'register_email': 'E-mail',
          'register_password': 'Lösenord',
          'register_enter_email': 'Ange en mail adress',
          'register_enter_password': 'Ange lösenord',
          'register_password_dont_match': 'Lösenord stämmer inte överens',
          'register_retype_password': 'Upprepa lösenord',
          'registerform_password_short': 'Lösenord måste minst inneha 8 tecken',
          'registerform_password_no_match': 'Lösenorden är inte lika',
          'login_controller_user_not_found':
              'Användare kunde inte hittas eller felaktigt lösenord',
          'login_controller_registration_error': 'Registrerings fel',
          'login_controller_ok': 'OK',
          'splash_view_text': 'Laddar...',
        },
        // 'pl_PL':{
        //   'home_title': 'Dom',
        //   'home_subtitle': 'Podtytuł',
        //   'home_button1': 'przejdź do logowania',
        //   'login_title': 'Zaloguj sie',
        // },
        // 'ru_RU':{
        //   'home_title': 'Домой',
        //   'home_subtitle': '3аглавие',
        //   'home_button1': 'перейти к логину',
        //   'login_title': 'Авторизоваться',
        // },
      };
}

class DatesTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'sv_SE': {
          //Days
          'Monday': 'Måndag',
          'Tuesday': 'Tisdag',
          'Wednesday': 'Onsdag',
          'Thursday': 'Torsdag',
          'Friday': 'Fredag',
          'Saturday': 'Lördag',
          'Sunday': 'Söndag',
          //Months
          'January': 'Januari',
          'February': 'Februari',
          'March': 'Mars',
          'April': 'April',
          'May': 'Maj',
          'June': 'Juni',
          'July': 'Juli',
          'August': 'Augusti',
          'September': 'September',
          'October': 'Oktober',
          'November': 'November',
          'December': 'December',
        },
      };
}
