import 'package:get/get.dart';

class FFMTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'null': '',
          'home_title': 'This whats in your fridge, ',
          'home_fridge_empty': 'Your fridge is empty!!',
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
          'register_name': 'Name',
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
          'registerform_name_empty' : 'This field cant be empty',
          'login_controller_user_not_found': 'User not found or bad password',
          'login_controller_registration_error': 'Register error',
          'login_controller_ok': 'OK',
          'splash_view_text': 'Loading...',
          'nav_messages' : 'Messages',
          'nav_sign_out' : 'Sign out',
          'home_add_stuff' : 'add stuff',
          'add_item_title' : 'Add to fridge',
          'add_item_photo' : 'Take a photo',
          'add_item_description' : 'Description',
          'add_item_slider_1_day' : '1 day',
          'add_item_slider_days' : ' days',
          'add_item_slider_1_week' : '1 week',
          'add_item_slider_weeks' : ' weeks',
          'add_item_slider_1_month' : '1 month',
          'add_item_slider_months' : ' months',
          'add_item_slider_for_ever' : 'For ever',
          'add_item_keep_for' :'Will keep for ',
          'add_item_image_cant_be_empty' : 'You need to provide a picture',
          'add_item_button_caption' : 'SAVE',
          'fridge_item_detail_title' : 'Please eat me!',
          'fridge_item_detail_best_before' : 'Best before: ',
          'fridge_item_detail_overdue' : 'NOTE! OVERDUE!!',
          'fridge_item_detail_alarm' : 'NOTE! Short date!!',
          'fridge_item_detail_promo' : 'Promoted!',
          'fridge_item_detail_snackbar_title' : 'Tap on image',
          'fridge_item_detail_snackbar_msg' : 'to mark',
          'fridge_item_detail_settingsform_title' : 'Fridge action',
          'fridge_item_detail_settingsform_headline' : 'What do you want to do with the food?',
          'fridge_item_detail_settingsform_promo' : 'Promote',
          'fridge_item_detail_settingsform_eat' : 'Eat',
          'fridge_item_detail_settingsform_trash' : 'Trash',
          'fridge_item_detail_settingsform_alert' : 'ALERT!!',
          'fridge_item_detail_settingsform_alert_eat' : 'You are about to mark this as EATEN!',
          'fridge_item_detail_settingsform_alert_trash' : 'You are about to mark this as TRASHED!',
          'fridge_item_detail_settingsform_alert_confirm' : 'OK',
          'fridge_item_detail_settingsform_alert_cancel' : 'CANCEL',
          'fridge_item_detail_settingsform_promoted' : 'Food promoted',
          'family_title' : 'Family',
          'family_headline' : 'My Family',
          'family_sub_headline' : '(and Fridge-Friends)',
          'family_add_member' : 'Add Family Member',
          'add_family_member_title' : 'Add Family Member',
          'log_msg_added' : ' put in fridge: ',
          'log_msg_promoted' : ' promoted: ',
          'log_msg_ate' : ' ate: ',
          'log_msg_trashed' : ' trashed: ',
          'msgs_title' : 'Messages and logs',
        },
        'sv_SE': {
          'null': '',
          'home_title': 'Detta är innehållet i din kyl, ',
          'home_fridge_empty': 'Din kyl är tom!!',
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
          'register_name': 'Namn',
          'register_email': 'E-mail',
          'register_password': 'Lösenord',
          'register_enter_email': 'Ange en mail adress',
          'register_enter_password': 'Ange lösenord',
          'register_password_dont_match': 'Lösenord stämmer inte överens',
          'register_retype_password': 'Upprepa lösenord',
          'registerform_password_short': 'Lösenord måste minst inneha 8 tecken',
          'registerform_password_no_match': 'Lösenorden är inte lika',
          'registerform_name_empty' : 'Detta fält får inte vara tomt',
          'login_controller_user_not_found':
              'Användare kunde inte hittas eller felaktigt lösenord',
          'login_controller_registration_error': 'Registrerings fel',
          'login_controller_ok': 'OK',
          'splash_view_text': 'Laddar...',
          'nav_messages' : 'Meddelande',
          'nav_sign_out' : 'Logga ut',
          'home_add_stuff' : 'lägg till',
          'add_item_title' : 'Lägg till i kylen',
          'add_item_photo' : 'Ta ett foto',
          'add_item_description' : 'Beskrivning',
          'add_item_slider_1_day' : '1 dag',
          'add_item_slider_days' : ' dagar',
          'add_item_slider_1_week' : '1 vecka',
          'add_item_slider_weeks' : ' veckor',
          'add_item_slider_1_month' : '1 månad',
          'add_item_slider_months' : ' månader',
          'add_item_slider_for_ever' : 'För alltid',
          'add_item_keep_for' :'Kommer att hålla i ',
          'add_item_image_cant_be_empty' : 'Du måste ta en bild!',
          'add_item_button_caption' : 'SPARA',
          'fridge_item_detail_title' : 'Ät mig!',
          'fridge_item_detail_best_before' : 'Bäst före: ',
          'fridge_item_detail_overdue' : 'NOTERA! GAMMAL!!',
          'fridge_item_detail_alarm' : 'NOTERA! Kort datum!!',
          'fridge_item_detail_promo' : 'Föreslagen!',
          'fridge_item_detail_snackbar_title' : 'Klicka på bild',
          'fridge_item_detail_snackbar_msg' : 'för att markera',
          'fridge_item_detail_settingsform_title' : 'Mat manipulering',
          'fridge_item_detail_settingsform_headline' : 'Vad vill du göra med maten?',
          'fridge_item_detail_settingsform_promo' : 'Föreslå',
          'fridge_item_detail_settingsform_eat' : 'Äta',
          'fridge_item_detail_settingsform_trash' : 'Slänga',
          'fridge_item_detail_settingsform_alert' : 'OBS!!',
          'fridge_item_detail_settingsform_alert_eat' : 'Du är på väg att markera maten som UPPÄTEN!',
          'fridge_item_detail_settingsform_alert_trash' : 'Du är på väg att markera maten SLÄNGD!',
          'fridge_item_detail_settingsform_alert_confirm' : 'OK',
          'fridge_item_detail_settingsform_alert_cancel' : 'AVBRYT',
          'fridge_item_detail_settingsform_promoted' : 'Mat föreslagen',
          'family_title' : 'Familj',
          'family_headline' : 'Min Familj',
          'family_sub_headline' : '(och Kylskåps-vänner)',
          'family_add_member' : 'Lägg till medlem',
          'add_family_member_title' : 'Lägg till medlem',
          'log_msg_added' : ' stoppade in i kyl: ',
          'log_msg_promoted' : ' föreslog: ',
          'log_msg_ate' : ' åt: ',
          'log_msg_trashed' : ' kastade: ',
          'msgs_title' : 'Meddelanden och loggar',
        },
        'pl_PL':{
          'null': '',
          'home_title': 'To co masz w lodówce, ',
          'home_fridge_empty': 'Your fridge is empty!!',
          'login_title': 'Zaloguj sie',
          'login_title_login': 'Zaloguj sie',
          'login_title_register': 'Zarejestrować sie',
          'login_new_account': 'Nie ma konta?',
          'login_button': 'Zaloguj sie',
          'login_email': 'E-mail',
          'login_password': 'Hasło',
          'login_enter_email': 'Proszę wpisać e-mail',
          'login_enter_password': 'Proszę wprowadzić hasło',
          'loginform_email_format': 'E-mail jest nieprawidłowy',
          'register_name': 'Nazwa',
          'register_email': 'E-mail',
          'register_password': 'Hasło',
          'register_button': 'Zarejestroj sie',
          'register_login': 'Zaloguj sie',
          'register_enter_email': 'Proszę wpisać e-mail',
          'register_enter_password': 'Proszę wpisać hasło',
          'register_password_dont_match': 'Hasło nie jest takie samo',
          'register_retype_password': 'Wpisz ponownie hasło',
          'registerform_password_short':
          'Hasło musi mieć co najmniej 8 znaków',
          'registerform_password_no_match': 'Hasło nie jest takie samo',
          'registerform_name_empty' : 'To pole nie może być puste',
          'login_controller_user_not_found': 'Nie znaleziono użytkownika lub złe hasło',
          'login_controller_registration_error': 'Błąd w rejestracji',
          'login_controller_ok': 'OK',
          'splash_view_text': 'Ładowanie...',
          'nav_messages' : 'Wiadomości',
          'nav_sign_out' : 'Wyloguj się',
          'home_add_stuff' : 'dodaj rzeczy',
          'add_item_title' : 'Dodaj do lodówki',
          'add_item_photo' : 'Zrób zdjęcie',
          'add_item_description' : 'Opis',
          'add_item_slider_1_day' : '1 dzień',
          'add_item_slider_days' : ' dni',
          'add_item_slider_1_week' : '1 tydzień',
          'add_item_slider_weeks' : ' tygodnie',
          'add_item_slider_1_month' : '1 miesiąc',
          'add_item_slider_months' : ' miesiące',
          'add_item_slider_for_ever' : 'Na zawsze',
          'add_item_keep_for' :'Zatrzymam się przez',
          'add_item_image_cant_be_empty' : 'Musisz podać zdjęcie',
          'add_item_button_caption' : 'ZAPISZ',
          'fridge_item_detail_title' : 'Proszę, zjedz mnie!',
          'fridge_item_detail_best_before' : 'Najlepiej przed: ',
          'fridge_item_detail_overdue' : 'UWAGA! STARY!!',
          'fridge_item_detail_alarm' : 'UWAGA! Krótka data!!',
          'fridge_item_detail_promo' : 'Polecane!',
          'fridge_item_detail_snackbar_title' : 'Stuknij w zdjęcie',
          'fridge_item_detail_snackbar_msg' : 'żeby oznaczyć',
          'fridge_item_detail_settingsform_title' : 'Lodówka akcja',
          'fridge_item_detail_settingsform_headline' : 'Co chcesz zrobić z jedzeniem?',
          'fridge_item_detail_settingsform_promo' : 'Polecać',
          'fridge_item_detail_settingsform_eat' : 'Jeść',
          'fridge_item_detail_settingsform_trash' : 'Wyrzuc',
          'fridge_item_detail_settingsform_alert' : 'UWAGA!!',
          'fridge_item_detail_settingsform_alert_eat' : 'Zamierzasz oznaczyć to jako JEDZONY!',
          'fridge_item_detail_settingsform_alert_trash' : 'Zamierzasz oznaczyć to jako WYRZUCONE!',
          'fridge_item_detail_settingsform_alert_confirm' : 'OK',
          'fridge_item_detail_settingsform_alert_cancel' : 'ANULUJ',
          'fridge_item_detail_settingsform_promoted' : 'Jedzenie polecane',
          'family_title' : 'Rodzina',
          'family_headline' : 'Moja Rodzina',
          'family_sub_headline' : '(i Lodówkowe-Przyjaciele)',
          'family_add_member' : 'Dodaj członka rodziny',
          'add_family_member_title' : 'Dodaj członka rodziny',
          'log_msg_added' : ' włożył do lodówki: ',
          'log_msg_promoted' : ' polecał(a): ',
          'log_msg_ate' : ' zjadł(a): ',
          'log_msg_trashed' : ' wyrzucił(a): ',
          'msgs_title' : 'Komunikaty i logi',
        },
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
