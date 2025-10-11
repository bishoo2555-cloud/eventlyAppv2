// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Search For Event`
  String get search_for_event {
    return Intl.message(
      'Search For Event',
      name: 'search_for_event',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back ✨`
  String get welcome_back {
    return Intl.message(
      'Welcome Back ✨',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Sport`
  String get sport {
    return Intl.message('Sport', name: 'sport', desc: '', args: []);
  }

  /// `Birthday`
  String get birthday {
    return Intl.message('Birthday', name: 'birthday', desc: '', args: []);
  }

  /// `Meeting`
  String get meeting {
    return Intl.message('Meeting', name: 'meeting', desc: '', args: []);
  }

  /// `Gaming`
  String get gaming {
    return Intl.message('Gaming', name: 'gaming', desc: '', args: []);
  }

  /// `WorkShop`
  String get workshop {
    return Intl.message('WorkShop', name: 'workshop', desc: '', args: []);
  }

  /// `Book Club`
  String get bookClub {
    return Intl.message('Book Club', name: 'bookClub', desc: '', args: []);
  }

  /// `Exhibition`
  String get exhibition {
    return Intl.message('Exhibition', name: 'exhibition', desc: '', args: []);
  }

  /// `Holiday`
  String get holiday {
    return Intl.message('Holiday', name: 'holiday', desc: '', args: []);
  }

  /// `Eating`
  String get eating {
    return Intl.message('Eating', name: 'eating', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Login With Google`
  String get login_with_google {
    return Intl.message(
      'Login With Google',
      name: 'login_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Already Have Account?`
  String get already_have_account {
    return Intl.message(
      'Already Have Account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Re Password`
  String get re_password {
    return Intl.message('Re Password', name: 're_password', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Map`
  String get map {
    return Intl.message('Map', name: 'map', desc: '', args: []);
  }

  /// `Favorite`
  String get favorite {
    return Intl.message('Favorite', name: 'favorite', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Alexandria,Egypt`
  String get alexandria {
    return Intl.message(
      'Alexandria,Egypt',
      name: 'alexandria',
      desc: '',
      args: [],
    );
  }

  /// `Don’t Have Account ?`
  String get dont_Have_account {
    return Intl.message(
      'Don’t Have Account ?',
      name: 'dont_Have_account',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Event Title`
  String get eventTitle {
    return Intl.message('Event Title', name: 'eventTitle', desc: '', args: []);
  }

  /// `Event Date`
  String get eventDate {
    return Intl.message('Event Date', name: 'eventDate', desc: '', args: []);
  }

  /// `Choose Date`
  String get chooseDate {
    return Intl.message('Choose Date', name: 'chooseDate', desc: '', args: []);
  }

  /// `Choose Time`
  String get chooseTime {
    return Intl.message('Choose Time', name: 'chooseTime', desc: '', args: []);
  }

  /// `Choose Event Location`
  String get chooseEventLocation {
    return Intl.message(
      'Choose Event Location',
      name: 'chooseEventLocation',
      desc: '',
      args: [],
    );
  }

  /// `Event Time`
  String get eventTime {
    return Intl.message('Event Time', name: 'eventTime', desc: '', args: []);
  }

  /// `Add Event`
  String get addEvent {
    return Intl.message('Add Event', name: 'addEvent', desc: '', args: []);
  }

  /// `Event Description`
  String get eventDescription {
    return Intl.message(
      'Event Description',
      name: 'eventDescription',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Description`
  String get describtion {
    return Intl.message('Description', name: 'describtion', desc: '', args: []);
  }

  /// `Create Event`
  String get CreateEvent {
    return Intl.message(
      'Create Event',
      name: 'CreateEvent',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Start`
  String get LetsStart {
    return Intl.message('Let’s Start', name: 'LetsStart', desc: '', args: []);
  }

  /// `Personalize Your Experience`
  String get Personalize_Your_Experience {
    return Intl.message(
      'Personalize Your Experience',
      name: 'Personalize_Your_Experience',
      desc: '',
      args: [],
    );
  }

  /// `Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.`
  String get obBoarding1dc {
    return Intl.message(
      'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
      name: 'obBoarding1dc',
      desc: '',
      args: [],
    );
  }

  /// `Find Events That Inspire You`
  String get Find_Events_That_Inspire_You {
    return Intl.message(
      'Find Events That Inspire You',
      name: 'Find_Events_That_Inspire_You',
      desc: '',
      args: [],
    );
  }

  /// `Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.`
  String get obBoarding2dc {
    return Intl.message(
      'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
      name: 'obBoarding2dc',
      desc: '',
      args: [],
    );
  }

  /// `Effortless Event Planning`
  String get Effortless_Event_Planning {
    return Intl.message(
      'Effortless Event Planning',
      name: 'Effortless_Event_Planning',
      desc: '',
      args: [],
    );
  }

  /// `Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.`
  String get obBoarding3dc {
    return Intl.message(
      'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
      name: 'obBoarding3dc',
      desc: '',
      args: [],
    );
  }

  /// `Connect with Friends & Share Moments`
  String get ConnectwithFriendsShareMoments {
    return Intl.message(
      'Connect with Friends & Share Moments',
      name: 'ConnectwithFriendsShareMoments',
      desc: '',
      args: [],
    );
  }

  /// `Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.`
  String get onBoardin4dc {
    return Intl.message(
      'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
      name: 'onBoardin4dc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
