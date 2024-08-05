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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Moscow State University of\n Technologies and Management`
  String get title_appbar {
    return Intl.message(
      'Moscow State University of\n Technologies and Management',
      name: 'title_appbar',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `Home Page`
  String get homePage {
    return Intl.message(
      'Home Page',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `Teachers`
  String get teachers {
    return Intl.message(
      'Teachers',
      name: 'teachers',
      desc: '',
      args: [],
    );
  }

  /// `Awards and achievements`
  String get awards {
    return Intl.message(
      'Awards and achievements',
      name: 'awards',
      desc: '',
      args: [],
    );
  }

  /// `Support chat`
  String get chat {
    return Intl.message(
      'Support chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Change theme`
  String get theme_update {
    return Intl.message(
      'Change theme',
      name: 'theme_update',
      desc: '',
      args: [],
    );
  }

  /// `Account information`
  String get accountInformation {
    return Intl.message(
      'Account information',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Main`
  String get main_settings {
    return Intl.message(
      'Main',
      name: 'main_settings',
      desc: '',
      args: [],
    );
  }

  /// `We are in social networks.\nSubscribe!`
  String get social_network {
    return Intl.message(
      'We are in social networks.\nSubscribe!',
      name: 'social_network',
      desc: '',
      args: [],
    );
  }

  /// `Our College of Information Systems and Technologies is a leading educational institution in the IT field, located in the historical center of Moscow. We have strong administrative and teaching capabilities, guaranteeing high quality education. Specialization in the field of information systems and technology provides unique opportunities for developing the skills and knowledge of students, among whom there are more than 300 people. Our teaching staff consists of experienced specialists who are ready to shape future IT professionals.`
  String get about {
    return Intl.message(
      'Our College of Information Systems and Technologies is a leading educational institution in the IT field, located in the historical center of Moscow. We have strong administrative and teaching capabilities, guaranteeing high quality education. Specialization in the field of information systems and technology provides unique opportunities for developing the skills and knowledge of students, among whom there are more than 300 people. Our teaching staff consists of experienced specialists who are ready to shape future IT professionals.',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful!`
  String get registrationSuccessful {
    return Intl.message(
      'Registration successful!',
      name: 'registrationSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in this field`
  String get emptyField {
    return Intl.message(
      'Please fill in this field',
      name: 'emptyField',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get validEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'validEmail',
      desc: '',
      args: [],
    );
  }

  /// `The password length must not be less than 8 characters.`
  String get password8 {
    return Intl.message(
      'The password length must not be less than 8 characters.',
      name: 'password8',
      desc: '',
      args: [],
    );
  }

  /// `The password must have at least one number`
  String get passwordNumber {
    return Intl.message(
      'The password must have at least one number',
      name: 'passwordNumber',
      desc: '',
      args: [],
    );
  }

  /// `The password must contain both lowercase and uppercase (capital) letters`
  String get passwordUpperLower {
    return Intl.message(
      'The password must contain both lowercase and uppercase (capital) letters',
      name: 'passwordUpperLower',
      desc: '',
      args: [],
    );
  }

  /// `The password must have at least one special character`
  String get specialChar {
    return Intl.message(
      'The password must have at least one special character',
      name: 'specialChar',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get load_app {
    return Intl.message(
      'Loading...',
      name: 'load_app',
      desc: '',
      args: [],
    );
  }

  /// `About the specialty`
  String get title_special {
    return Intl.message(
      'About the specialty',
      name: 'title_special',
      desc: '',
      args: [],
    );
  }

  /// `Humanity is increasingly relying on the work of smart machines. And it is programmers who make smart machines. Modern programmers not only write program code, they think over the architecture of systems, create and train artificial intelligence, and develop robots. The demand for highly qualified programmers is growing every day. Many professions will disappear in the future, but not the profession of a programmer.`
  String get text_speciality1 {
    return Intl.message(
      'Humanity is increasingly relying on the work of smart machines. And it is programmers who make smart machines. Modern programmers not only write program code, they think over the architecture of systems, create and train artificial intelligence, and develop robots. The demand for highly qualified programmers is growing every day. Many professions will disappear in the future, but not the profession of a programmer.',
      name: 'text_speciality1',
      desc: '',
      args: [],
    );
  }

  /// `02.09.07 Information systems\n and programming`
  String get special_090307 {
    return Intl.message(
      '02.09.07 Information systems\n and programming',
      name: 'special_090307',
      desc: '',
      args: [],
    );
  }

  /// `At our college, you will learn how to program, starting with the fundamentals (namely, their understanding is checked at job interviews) and ending with the development of mobile applications using a rising star - the most modern programming language kotlin. During the training, you will master the foundation of modern development - object-oriented programming (including programming patterns and the latest frameworks) and functional programming, which is becoming popular again. You will acquire flexible skills (Soft Skills), such as presentation skills, successful communication, self-study, and work in a project team, which guarantees successful adaptation in a rapidly changing world. Choosing the qualification "programmer" or "developer of web and multimedia applications" is the key to success in a professional career.`
  String get text_speciality2 {
    return Intl.message(
      'At our college, you will learn how to program, starting with the fundamentals (namely, their understanding is checked at job interviews) and ending with the development of mobile applications using a rising star - the most modern programming language kotlin. During the training, you will master the foundation of modern development - object-oriented programming (including programming patterns and the latest frameworks) and functional programming, which is becoming popular again. You will acquire flexible skills (Soft Skills), such as presentation skills, successful communication, self-study, and work in a project team, which guarantees successful adaptation in a rapidly changing world. Choosing the qualification "programmer" or "developer of web and multimedia applications" is the key to success in a professional career.',
      name: 'text_speciality2',
      desc: '',
      args: [],
    );
  }

  /// `The composition of teaching staff`
  String get teacher_list {
    return Intl.message(
      'The composition of teaching staff',
      name: 'teacher_list',
      desc: '',
      args: [],
    );
  }

  /// `Alexander I. Glusker, Chairman of the PCC, teacher`
  String get gluscer {
    return Intl.message(
      'Alexander I. Glusker, Chairman of the PCC, teacher',
      name: 'gluscer',
      desc: '',
      args: [],
    );
  }

  /// `Alexandrov Roman Viktorovich, College director, teacher`
  String get director {
    return Intl.message(
      'Alexandrov Roman Viktorovich, College director, teacher',
      name: 'director',
      desc: '',
      args: [],
    );
  }

  /// `Mikhail Vladimirovich Valeev, teacher`
  String get valeev {
    return Intl.message(
      'Mikhail Vladimirovich Valeev, teacher',
      name: 'valeev',
      desc: '',
      args: [],
    );
  }

  /// `Dzyuba Irina Georgievna, Head of Department No. 3, teacher`
  String get dzuba {
    return Intl.message(
      'Dzyuba Irina Georgievna, Head of Department No. 3, teacher',
      name: 'dzuba',
      desc: '',
      args: [],
    );
  }

  /// `Kuzmenko Svetlana Yurievna, teacher`
  String get kuzma {
    return Intl.message(
      'Kuzmenko Svetlana Yurievna, teacher',
      name: 'kuzma',
      desc: '',
      args: [],
    );
  }

  /// `Larionova Elena Anatolyevna, teacher`
  String get larionova {
    return Intl.message(
      'Larionova Elena Anatolyevna, teacher',
      name: 'larionova',
      desc: '',
      args: [],
    );
  }

  /// `Plakhutina Larisa Alexandrovna`
  String get plahutina {
    return Intl.message(
      'Plakhutina Larisa Alexandrovna',
      name: 'plahutina',
      desc: '',
      args: [],
    );
  }

  /// `Valery A. Podobin, teacher`
  String get podobin {
    return Intl.message(
      'Valery A. Podobin, teacher',
      name: 'podobin',
      desc: '',
      args: [],
    );
  }

  /// `Sabirdzhanova Ekaterina Vitalievna`
  String get sabirhanova {
    return Intl.message(
      'Sabirdzhanova Ekaterina Vitalievna',
      name: 'sabirhanova',
      desc: '',
      args: [],
    );
  }

  /// `Alyona Vitalievna Khustochka, teacher`
  String get hustochka {
    return Intl.message(
      'Alyona Vitalievna Khustochka, teacher',
      name: 'hustochka',
      desc: '',
      args: [],
    );
  }

  /// `The field of professional activity of graduates`
  String get list_point_tittle1 {
    return Intl.message(
      'The field of professional activity of graduates',
      name: 'list_point_tittle1',
      desc: '',
      args: [],
    );
  }

  /// `Development of software modules for computer systems`
  String get list_point1_item1 {
    return Intl.message(
      'Development of software modules for computer systems',
      name: 'list_point1_item1',
      desc: '',
      args: [],
    );
  }

  /// `Implementation of the integration of software modules`
  String get list_point1_item2 {
    return Intl.message(
      'Implementation of the integration of software modules',
      name: 'list_point1_item2',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance and maintenance of computer system software`
  String get list_point1_item3 {
    return Intl.message(
      'Maintenance and maintenance of computer system software',
      name: 'list_point1_item3',
      desc: '',
      args: [],
    );
  }

  /// `Database and server administration`
  String get list_point1_item4 {
    return Intl.message(
      'Database and server administration',
      name: 'list_point1_item4',
      desc: '',
      args: [],
    );
  }

  /// `Database development, administration and protection`
  String get list_point1_item5 {
    return Intl.message(
      'Database development, administration and protection',
      name: 'list_point1_item5',
      desc: '',
      args: [],
    );
  }

  /// `Design and development of information systems`
  String get list_point1_item6 {
    return Intl.message(
      'Design and development of information systems',
      name: 'list_point1_item6',
      desc: '',
      args: [],
    );
  }

  /// `Web Application Design development`
  String get list_point1_item7 {
    return Intl.message(
      'Web Application Design development',
      name: 'list_point1_item7',
      desc: '',
      args: [],
    );
  }

  /// `Design, development and optimization of web applications`
  String get list_point1_item8 {
    return Intl.message(
      'Design, development and optimization of web applications',
      name: 'list_point1_item8',
      desc: '',
      args: [],
    );
  }

  /// `Duration of study: 3 years 10 months`
  String get data_special {
    return Intl.message(
      'Duration of study: 3 years 10 months',
      name: 'data_special',
      desc: '',
      args: [],
    );
  }

  /// `Graduate qualification (assigned depending on the chosen specialization):`
  String get list_point_tittle2 {
    return Intl.message(
      'Graduate qualification (assigned depending on the chosen specialization):',
      name: 'list_point_tittle2',
      desc: '',
      args: [],
    );
  }

  /// `database administrator;`
  String get list_point2_item1 {
    return Intl.message(
      'database administrator;',
      name: 'list_point2_item1',
      desc: '',
      args: [],
    );
  }

  /// `information technology testing specialist;`
  String get list_point2_item2 {
    return Intl.message(
      'information technology testing specialist;',
      name: 'list_point2_item2',
      desc: '',
      args: [],
    );
  }

  /// `programmer;`
  String get list_point2_item3 {
    return Intl.message(
      'programmer;',
      name: 'list_point2_item3',
      desc: '',
      args: [],
    );
  }

  /// `technical writer;`
  String get list_point2_item4 {
    return Intl.message(
      'technical writer;',
      name: 'list_point2_item4',
      desc: '',
      args: [],
    );
  }

  /// `information Systems Specialist;`
  String get list_point2_item5 {
    return Intl.message(
      'information Systems Specialist;',
      name: 'list_point2_item5',
      desc: '',
      args: [],
    );
  }

  /// `information Resources Specialist;`
  String get list_point2_item6 {
    return Intl.message(
      'information Resources Specialist;',
      name: 'list_point2_item6',
      desc: '',
      args: [],
    );
  }

  /// `developer of web and multimedia applications.`
  String get list_point2_item7 {
    return Intl.message(
      'developer of web and multimedia applications.',
      name: 'list_point2_item7',
      desc: '',
      args: [],
    );
  }

  /// `Specialty code: 02.09.07`
  String get title090207 {
    return Intl.message(
      'Specialty code: 02.09.07',
      name: 'title090207',
      desc: '',
      args: [],
    );
  }

  /// `Name of the specialty: Information systems and programming`
  String get name_special {
    return Intl.message(
      'Name of the specialty: Information systems and programming',
      name: 'name_special',
      desc: '',
      args: [],
    );
  }

  /// `Duration of study: on the basis of basic general education, 3 years 10 months`
  String get data_special_table {
    return Intl.message(
      'Duration of study: on the basis of basic general education, 3 years 10 months',
      name: 'data_special_table',
      desc: '',
      args: [],
    );
  }

  /// `Budget: 150`
  String get budhet {
    return Intl.message(
      'Budget: 150',
      name: 'budhet',
      desc: '',
      args: [],
    );
  }

  /// `Contract: 50`
  String get payment {
    return Intl.message(
      'Contract: 50',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `105120, Moscow, Kostomarovskaya embankment d. 29, +7(985)197-97-58, +7(915)405-46-06, 8(495)640-54-36 ext. 4846 (Admission Committee), priemka@mgkit.ru`
  String get adress {
    return Intl.message(
      '105120, Moscow, Kostomarovskaya embankment d. 29, +7(985)197-97-58, +7(915)405-46-06, 8(495)640-54-36 ext. 4846 (Admission Committee), priemka@mgkit.ru',
      name: 'adress',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get local {
    return Intl.message(
      'Language',
      name: 'local',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get russian {
    return Intl.message(
      'Russian',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get navigateBottom2 {
    return Intl.message(
      'User',
      name: 'navigateBottom2',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error has occurred. We apologize for the inconvenience`
  String get error_mes {
    return Intl.message(
      'An unknown error has occurred. We apologize for the inconvenience',
      name: 'error_mes',
      desc: '',
      args: [],
    );
  }

  /// `Other ways to log in`
  String get altsign {
    return Intl.message(
      'Other ways to log in',
      name: 'altsign',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get reg {
    return Intl.message(
      'Registration',
      name: 'reg',
      desc: '',
      args: [],
    );
  }

  /// `Frequently Asked Questions`
  String get question_title {
    return Intl.message(
      'Frequently Asked Questions',
      name: 'question_title',
      desc: '',
      args: [],
    );
  }

  /// `What subjects will I study as a programmer?`
  String get q1 {
    return Intl.message(
      'What subjects will I study as a programmer?',
      name: 'q1',
      desc: '',
      args: [],
    );
  }

  /// `What professional skills can be acquired at the College of Information Systems and Technology?`
  String get q2 {
    return Intl.message(
      'What professional skills can be acquired at the College of Information Systems and Technology?',
      name: 'q2',
      desc: '',
      args: [],
    );
  }

  /// `What employment opportunities are there for graduates of the programmer specialty?`
  String get q3 {
    return Intl.message(
      'What employment opportunities are there for graduates of the programmer specialty?',
      name: 'q3',
      desc: '',
      args: [],
    );
  }

  /// `Is there a college internship for students majoring in computer programming?`
  String get q4 {
    return Intl.message(
      'Is there a college internship for students majoring in computer programming?',
      name: 'q4',
      desc: '',
      args: [],
    );
  }

  /// `How long does it take to study as a programmer in college?`
  String get q5 {
    return Intl.message(
      'How long does it take to study as a programmer in college?',
      name: 'q5',
      desc: '',
      args: [],
    );
  }

  /// `What are the requirements for admission to the programmer's specialty at the College of Information Systems and Technologies?`
  String get q6 {
    return Intl.message(
      'What are the requirements for admission to the programmer\'s specialty at the College of Information Systems and Technologies?',
      name: 'q6',
      desc: '',
      args: [],
    );
  }

  /// `Can I work in parallel with studying to be a programmer?`
  String get q7 {
    return Intl.message(
      'Can I work in parallel with studying to be a programmer?',
      name: 'q7',
      desc: '',
      args: [],
    );
  }

  /// `What are the career prospects for a programming specialist?`
  String get q8 {
    return Intl.message(
      'What are the career prospects for a programming specialist?',
      name: 'q8',
      desc: '',
      args: [],
    );
  }

  /// `What additional educational resources does the college provide for students majoring in programming?`
  String get q9 {
    return Intl.message(
      'What additional educational resources does the college provide for students majoring in programming?',
      name: 'q9',
      desc: '',
      args: [],
    );
  }

  /// `What types of projects do students carry out in the specialty programmer?`
  String get q10 {
    return Intl.message(
      'What types of projects do students carry out in the specialty programmer?',
      name: 'q10',
      desc: '',
      args: [],
    );
  }

  /// `As a programmer, you will study programming, databases, algorithms and data structures, web development, computer networks, operating systems and other technical disciplines.`
  String get answer1 {
    return Intl.message(
      'As a programmer, you will study programming, databases, algorithms and data structures, web development, computer networks, operating systems and other technical disciplines.',
      name: 'answer1',
      desc: '',
      args: [],
    );
  }

  /// `You will be able to acquire programming skills in various languages, work with databases, develop web applications, test software, analyze data and much more.`
  String get answer2 {
    return Intl.message(
      'You will be able to acquire programming skills in various languages, work with databases, develop web applications, test software, analyze data and much more.',
      name: 'answer2',
      desc: '',
      args: [],
    );
  }

  /// `Graduates of the programmer specialty are in demand in the labor market as software developers, testers, system analysts, as well as information security specialists.`
  String get answer3 {
    return Intl.message(
      'Graduates of the programmer specialty are in demand in the labor market as software developers, testers, system analysts, as well as information security specialists.',
      name: 'answer3',
      desc: '',
      args: [],
    );
  }

  /// `Yes, the College of Information Systems and Technologies provides practices that allow students to apply their knowledge in practice in real projects and companies.`
  String get answer4 {
    return Intl.message(
      'Yes, the College of Information Systems and Technologies provides practices that allow students to apply their knowledge in practice in real projects and companies.',
      name: 'answer4',
      desc: '',
      args: [],
    );
  }

  /// `Usually, training in the specialty of a programmer in college lasts from 2 to 3 years, depending on the form of study (full-time / part-time) and the training program.`
  String get answer5 {
    return Intl.message(
      'Usually, training in the specialty of a programmer in college lasts from 2 to 3 years, depending on the form of study (full-time / part-time) and the training program.',
      name: 'answer5',
      desc: '',
      args: [],
    );
  }

  /// `Admission to the programmer's specialty usually requires secondary education, successful completion of entrance exams in mathematics and computer science, as well as a desire to study computer technology.`
  String get answer6 {
    return Intl.message(
      'Admission to the programmer\'s specialty usually requires secondary education, successful completion of entrance exams in mathematics and computer science, as well as a desire to study computer technology.',
      name: 'answer6',
      desc: '',
      args: [],
    );
  }

  /// `For most students, studying as a programmer requires full dedication and time, but some students successfully combine their studies with work.`
  String get answer7 {
    return Intl.message(
      'For most students, studying as a programmer requires full dedication and time, but some students successfully combine their studies with work.',
      name: 'answer7',
      desc: '',
      args: [],
    );
  }

  /// `Programming specialists have excellent career prospects, as the IT industry is constantly developing, and the demand for qualified programming specialists is only growing.`
  String get answer8 {
    return Intl.message(
      'Programming specialists have excellent career prospects, as the IT industry is constantly developing, and the demand for qualified programming specialists is only growing.',
      name: 'answer8',
      desc: '',
      args: [],
    );
  }

  /// `The College of Information Systems and Technology provides students with access to libraries, online courses, workshops, conferences and other educational resources to enhance knowledge and skills.`
  String get answer9 {
    return Intl.message(
      'The College of Information Systems and Technology provides students with access to libraries, online courses, workshops, conferences and other educational resources to enhance knowledge and skills.',
      name: 'answer9',
      desc: '',
      args: [],
    );
  }

  /// `Students of the programmer specialty carry out various projects, starting from the creation of websites and applications, ending with the development of algorithms and games, which allows them to apply their knowledge in practice.`
  String get answer10 {
    return Intl.message(
      'Students of the programmer specialty carry out various projects, starting from the creation of websites and applications, ending with the development of algorithms and games, which allows them to apply their knowledge in practice.',
      name: 'answer10',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contact {
    return Intl.message(
      'Contacts',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `PDF downloaded successfully`
  String get pdf_dowload {
    return Intl.message(
      'PDF downloaded successfully',
      name: 'pdf_dowload',
      desc: '',
      args: [],
    );
  }

  /// `Failed to download PDF`
  String get failed_dowload_pdf {
    return Intl.message(
      'Failed to download PDF',
      name: 'failed_dowload_pdf',
      desc: '',
      args: [],
    );
  }

  /// `The download is complete`
  String get dowload_mes {
    return Intl.message(
      'The download is complete',
      name: 'dowload_mes',
      desc: '',
      args: [],
    );
  }

  /// `UniKIT`
  String get title_coledge {
    return Intl.message(
      'UniKIT',
      name: 'title_coledge',
      desc: '',
      args: [],
    );
  }

  /// `Documents`
  String get document_title {
    return Intl.message(
      'Documents',
      name: 'document_title',
      desc: '',
      args: [],
    );
  }

  /// `Enrollment orders`
  String get enrollment {
    return Intl.message(
      'Enrollment orders',
      name: 'enrollment',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Replace`
  String get replace {
    return Intl.message(
      'Replace',
      name: 'replace',
      desc: '',
      args: [],
    );
  }

  /// `Replace Document`
  String get replaceDocument {
    return Intl.message(
      'Replace Document',
      name: 'replaceDocument',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name_doc {
    return Intl.message(
      'Name',
      name: 'name_doc',
      desc: '',
      args: [],
    );
  }

  /// `URL`
  String get url_doc {
    return Intl.message(
      'URL',
      name: 'url_doc',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Add Document`
  String get add_title_doc {
    return Intl.message(
      'Add Document',
      name: 'add_title_doc',
      desc: '',
      args: [],
    );
  }

  /// `The college is located at:`
  String get contact_adress {
    return Intl.message(
      'The college is located at:',
      name: 'contact_adress',
      desc: '',
      args: [],
    );
  }

  /// `105120, Moscow, Kostomarovskaya embankment, 29`
  String get adress1 {
    return Intl.message(
      '105120, Moscow, Kostomarovskaya embankment, 29',
      name: 'adress1',
      desc: '',
      args: [],
    );
  }

  /// `Transit:`
  String get thoroughfare {
    return Intl.message(
      'Transit:',
      name: 'thoroughfare',
      desc: '',
      args: [],
    );
  }

  /// `Email:`
  String get email_static {
    return Intl.message(
      'Email:',
      name: 'email_static',
      desc: '',
      args: [],
    );
  }

  /// `Telephone:`
  String get phone_number {
    return Intl.message(
      'Telephone:',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Kurskaya metro station, Chkalovskaya, Ilyich Square, Rimskaya, then walk towards the Metrostroy recreation center.`
  String get adress2 {
    return Intl.message(
      'Kurskaya metro station, Chkalovskaya, Ilyich Square, Rimskaya, then walk towards the Metrostroy recreation center.',
      name: 'adress2',
      desc: '',
      args: [],
    );
  }

  /// `log out of your account`
  String get userExit {
    return Intl.message(
      'log out of your account',
      name: 'userExit',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get changeEmail {
    return Intl.message(
      'Change Email',
      name: 'changeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Change Name`
  String get changeName {
    return Intl.message(
      'Change Name',
      name: 'changeName',
      desc: '',
      args: [],
    );
  }

  /// `User Info`
  String get userInfo {
    return Intl.message(
      'User Info',
      name: 'userInfo',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get submit {
    return Intl.message(
      'Confirmation',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to get out?`
  String get exitTrueF {
    return Intl.message(
      'Are you sure you want to get out?',
      name: 'exitTrueF',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get submit_button {
    return Intl.message(
      'Confirm',
      name: 'submit_button',
      desc: '',
      args: [],
    );
  }

  /// `Enter the password:`
  String get enterPassword {
    return Intl.message(
      'Enter the password:',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgot {
    return Intl.message(
      'Forgot your password?',
      name: 'forgot',
      desc: '',
      args: [],
    );
  }

  /// `The password reset email has been sent. Check your email.`
  String get messageWarningEmail {
    return Intl.message(
      'The password reset email has been sent. Check your email.',
      name: 'messageWarningEmail',
      desc: '',
      args: [],
    );
  }

  /// `Error when sending a password reset email:`
  String get errorSendLetter {
    return Intl.message(
      'Error when sending a password reset email:',
      name: 'errorSendLetter',
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
      Locale.fromSubtags(languageCode: 'ru'),
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
