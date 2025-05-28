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

  /// `Sign In`
  String get signIn_title {
    return Intl.message('Sign In', name: 'signIn_title', desc: '', args: []);
  }

  /// `Craft Your Career, Shape Your Path`
  String get signIn_subtitle {
    return Intl.message(
      'Craft Your Career, Shape Your Path',
      name: 'signIn_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get signIn_fields_email_label {
    return Intl.message(
      'Email',
      name: 'signIn_fields_email_label',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signIn_fields_password_label {
    return Intl.message(
      'Password',
      name: 'signIn_fields_password_label',
      desc: '',
      args: [],
    );
  }

  /// `If your email is not registered, please contact the administrator at your branch for assistance.`
  String get signIn_notice {
    return Intl.message(
      'If your email is not registered, please contact the administrator at your branch for assistance.',
      name: 'signIn_notice',
      desc: '',
      args: [],
    );
  }

  /// `Click here to explore features, benefits, and how to make the most of your experience.`
  String get signIn_learnMore_text {
    return Intl.message(
      'Click here to explore features, benefits, and how to make the most of your experience.',
      name: 'signIn_learnMore_text',
      desc: '',
      args: [],
    );
  }

  /// `Learn More!`
  String get signIn_learnMore_linkText {
    return Intl.message(
      'Learn More!',
      name: 'signIn_learnMore_linkText',
      desc: '',
      args: [],
    );
  }

  /// `/learn-more`
  String get signIn_learnMore_url {
    return Intl.message(
      '/learn-more',
      name: 'signIn_learnMore_url',
      desc: '',
      args: [],
    );
  }

  /// `Forget your password ?`
  String get signIn_forget {
    return Intl.message(
      'Forget your password ?',
      name: 'signIn_forget',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get errors_emailRequired {
    return Intl.message(
      'Email is required',
      name: 'errors_emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Entered value does not match email format`
  String get errors_invalidEmail {
    return Intl.message(
      'Entered value does not match email format',
      name: 'errors_invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get errors_passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'errors_passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get errors_passwordMinLength {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'errors_passwordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassword_title {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword_title',
      desc: '',
      args: [],
    );
  }

  /// `Craft Your Career, Shape Your Path`
  String get forgetPassword_subtitle {
    return Intl.message(
      'Craft Your Career, Shape Your Path',
      name: 'forgetPassword_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get forgetPassword_fields_email_label {
    return Intl.message(
      'Email',
      name: 'forgetPassword_fields_email_label',
      desc: '',
      args: [],
    );
  }

  /// `If you've forgotten your password, please enter the email address you registered with in ITI, You will receive a code to reset your password.`
  String get forgetPassword_notice {
    return Intl.message(
      'If you\'ve forgotten your password, please enter the email address you registered with in ITI, You will receive a code to reset your password.',
      name: 'forgetPassword_notice',
      desc: '',
      args: [],
    );
  }

  /// `Back to Sign in Page`
  String get forgetPassword_signIn {
    return Intl.message(
      'Back to Sign in Page',
      name: 'forgetPassword_signIn',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get forgetPassword_button {
    return Intl.message(
      'Send Code',
      name: 'forgetPassword_button',
      desc: '',
      args: [],
    );
  }

  /// `Enter Verification Code`
  String get verifyCody_title {
    return Intl.message(
      'Enter Verification Code',
      name: 'verifyCody_title',
      desc: '',
      args: [],
    );
  }

  /// `Craft Your Career, Shape Your Path`
  String get verifyCody_subtitle {
    return Intl.message(
      'Craft Your Career, Shape Your Path',
      name: 'verifyCody_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `We have sent an email to your registered email address with a verification code.`
  String get verifyCody_notice {
    return Intl.message(
      'We have sent an email to your registered email address with a verification code.',
      name: 'verifyCody_notice',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verifyCody_submit {
    return Intl.message(
      'Verify Code',
      name: 'verifyCody_submit',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get verifyCody_resend {
    return Intl.message(
      'Resend Code',
      name: 'verifyCody_resend',
      desc: '',
      args: [],
    );
  }

  /// `Back to Sign in Page`
  String get verifyCody_signIn {
    return Intl.message(
      'Back to Sign in Page',
      name: 'verifyCody_signIn',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your New Password`
  String get resetPassword_title {
    return Intl.message(
      'Enter Your New Password',
      name: 'resetPassword_title',
      desc: '',
      args: [],
    );
  }

  /// `Craft Your Career, Shape Your Path`
  String get resetPassword_subtitle {
    return Intl.message(
      'Craft Your Career, Shape Your Path',
      name: 'resetPassword_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get resetPassword_placeholder1 {
    return Intl.message(
      'Password',
      name: 'resetPassword_placeholder1',
      desc: '',
      args: [],
    );
  }

  /// `Repeat Password`
  String get resetPassword_placeholder2 {
    return Intl.message(
      'Repeat Password',
      name: 'resetPassword_placeholder2',
      desc: '',
      args: [],
    );
  }

  /// `Change Passsword`
  String get resetPassword_submit {
    return Intl.message(
      'Change Passsword',
      name: 'resetPassword_submit',
      desc: '',
      args: [],
    );
  }

  /// `Back to Sign in Page`
  String get resetPassword_signIn {
    return Intl.message(
      'Back to Sign in Page',
      name: 'resetPassword_signIn',
      desc: '',
      args: [],
    );
  }

  /// `Changed Successfully!`
  String get passwordDialog_title {
    return Intl.message(
      'Changed Successfully!',
      name: 'passwordDialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed successfully. You can now sign in using your new password.`
  String get passwordDialog_context {
    return Intl.message(
      'Your password has been changed successfully. You can now sign in using your new password.',
      name: 'passwordDialog_context',
      desc: '',
      args: [],
    );
  }

  /// `Sign IN`
  String get passwordDialog_submit {
    return Intl.message(
      'Sign IN',
      name: 'passwordDialog_submit',
      desc: '',
      args: [],
    );
  }

  /// `Craft Your Career, Shape Your Path`
  String get header_subTitle {
    return Intl.message(
      'Craft Your Career, Shape Your Path',
      name: 'header_subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get header_home {
    return Intl.message('Home', name: 'header_home', desc: '', args: []);
  }

  /// `Chats`
  String get header_chats {
    return Intl.message('Chats', name: 'header_chats', desc: '', args: []);
  }

  /// `Add New Job`
  String get header_addNewJob {
    return Intl.message(
      'Add New Job',
      name: 'header_addNewJob',
      desc: '',
      args: [],
    );
  }

  /// `Add New Certificate`
  String get header_addNewCertificate {
    return Intl.message(
      'Add New Certificate',
      name: 'header_addNewCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Talk to AI`
  String get header_ai {
    return Intl.message('Talk to AI', name: 'header_ai', desc: '', args: []);
  }

  /// `Add New Certificate`
  String get header_certificate {
    return Intl.message(
      'Add New Certificate',
      name: 'header_certificate',
      desc: '',
      args: [],
    );
  }

  /// `Talk to AI`
  String get header_talktoAi {
    return Intl.message(
      'Talk to AI',
      name: 'header_talktoAi',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get header_notification {
    return Intl.message(
      'Notification',
      name: 'header_notification',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get header_settings {
    return Intl.message(
      'Settings',
      name: 'header_settings',
      desc: '',
      args: [],
    );
  }

  /// `Chat with us`
  String get header_chat {
    return Intl.message(
      'Chat with us',
      name: 'header_chat',
      desc: '',
      args: [],
    );
  }

  /// `About ITI Freelancing Hub`
  String get header_about {
    return Intl.message(
      'About ITI Freelancing Hub',
      name: 'header_about',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get header_about2 {
    return Intl.message('About', name: 'header_about2', desc: '', args: []);
  }

  /// `Account`
  String get header_account {
    return Intl.message('Account', name: 'header_account', desc: '', args: []);
  }

  /// `Sign out`
  String get header_signOut {
    return Intl.message('Sign out', name: 'header_signOut', desc: '', args: []);
  }

  /// `Settings`
  String get settings_title {
    return Intl.message('Settings', name: 'settings_title', desc: '', args: []);
  }

  /// `Edit My Profile`
  String get settings_title2 {
    return Intl.message(
      'Edit My Profile',
      name: 'settings_title2',
      desc: '',
      args: [],
    );
  }

  /// `Chat with Admin`
  String get settings_title3 {
    return Intl.message(
      'Chat with Admin',
      name: 'settings_title3',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get settings_title4 {
    return Intl.message(
      'Reset Password',
      name: 'settings_title4',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get settings_subTitle1 {
    return Intl.message(
      'General',
      name: 'settings_subTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get settings_subTitle2 {
    return Intl.message(
      'Account Settings',
      name: 'settings_subTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get settings_subTitle3 {
    return Intl.message(
      'Support',
      name: 'settings_subTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get settings_theme {
    return Intl.message('Theme', name: 'settings_theme', desc: '', args: []);
  }

  /// `Language`
  String get settings_language {
    return Intl.message(
      'Language',
      name: 'settings_language',
      desc: '',
      args: [],
    );
  }

  /// `Edit My Profile`
  String get settings_editMyProfile {
    return Intl.message(
      'Edit My Profile',
      name: 'settings_editMyProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get settings_changePassword {
    return Intl.message(
      'Change Password',
      name: 'settings_changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Chat with us`
  String get settings_chat {
    return Intl.message(
      'Chat with us',
      name: 'settings_chat',
      desc: '',
      args: [],
    );
  }

  /// `About ITI Freelancing Hub`
  String get settings_about {
    return Intl.message(
      'About ITI Freelancing Hub',
      name: 'settings_about',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get settings_notifications {
    return Intl.message(
      'Notifications',
      name: 'settings_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get settings_back {
    return Intl.message('Back', name: 'settings_back', desc: '', args: []);
  }

  /// `Back to Settings`
  String get settings_settingBack {
    return Intl.message(
      'Back to Settings',
      name: 'settings_settingBack',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get settings_submit {
    return Intl.message('Submit', name: 'settings_submit', desc: '', args: []);
  }

  /// `Get Started`
  String get settings_getStarted {
    return Intl.message(
      'Get Started',
      name: 'settings_getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get settings_currentPassword {
    return Intl.message(
      'Current Password',
      name: 'settings_currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get settings_newPassword {
    return Intl.message(
      'New Password',
      name: 'settings_newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Repeat New Password`
  String get settings_repeatPassword {
    return Intl.message(
      'Repeat New Password',
      name: 'settings_repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully!`
  String get settings_passwordResetSuccess {
    return Intl.message(
      'Password changed successfully!',
      name: 'settings_passwordResetSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to change password. Try again.`
  String get settings_passwordResetError {
    return Intl.message(
      'Failed to change password. Try again.',
      name: 'settings_passwordResetError',
      desc: '',
      args: [],
    );
  }

  /// `Your personal information is based on what you registered during the training. If you need to update any of this information, please contact the admin for assistance.`
  String get settings_editProfileDesc {
    return Intl.message(
      'Your personal information is based on what you registered during the training. If you need to update any of this information, please contact the admin for assistance.',
      name: 'settings_editProfileDesc',
      desc: '',
      args: [],
    );
  }

  /// `If you have any questions or encounter any issues, you’re in the right place.`
  String get settings_chatsMainDesc {
    return Intl.message(
      'If you have any questions or encounter any issues, you’re in the right place.',
      name: 'settings_chatsMainDesc',
      desc: '',
      args: [],
    );
  }

  /// `Welcome! If you have any questions or problems, feel free to chat with our admin here. Just type your message below, and we’ll get back to you as soon as possible. We're here to help!`
  String get settings_chatSecDesc {
    return Intl.message(
      'Welcome! If you have any questions or problems, feel free to chat with our admin here. Just type your message below, and we’ll get back to you as soon as possible. We\'re here to help!',
      name: 'settings_chatSecDesc',
      desc: '',
      args: [],
    );
  }

  /// `If you’ve forgotten your password, simply sign out and click on 'Forgot Password?' on the login page to reset it using your registered email address.`
  String get settings_resetPasswordDesc {
    return Intl.message(
      'If you’ve forgotten your password, simply sign out and click on \'Forgot Password?\' on the login page to reset it using your registered email address.',
      name: 'settings_resetPasswordDesc',
      desc: '',
      args: [],
    );
  }

  /// `What is the ITI Freelancing Hub?`
  String get learnMore_title {
    return Intl.message(
      'What is the ITI Freelancing Hub?',
      name: 'learnMore_title',
      desc: '',
      args: [],
    );
  }

  /// `The ITI Freelancing Hub is designed specifically for students who have secured their own freelancing jobs. This platform allows students to upload the details of their jobs for administrative approval. Once approved, these opportunities contribute to their graduation requirements.`
  String get learnMore_subtitle {
    return Intl.message(
      'The ITI Freelancing Hub is designed specifically for students who have secured their own freelancing jobs. This platform allows students to upload the details of their jobs for administrative approval. Once approved, these opportunities contribute to their graduation requirements.',
      name: 'learnMore_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `How to Use the Platform?`
  String get learnMore_howToUse {
    return Intl.message(
      'How to Use the Platform?',
      name: 'learnMore_howToUse',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get learnMore_back {
    return Intl.message('Back', name: 'learnMore_back', desc: '', args: []);
  }

  /// `© 2025 ITI Freelancing Hub. All rights reserved.`
  String get learnMore_copyright {
    return Intl.message(
      '© 2025 ITI Freelancing Hub. All rights reserved.',
      name: 'learnMore_copyright',
      desc: '',
      args: [],
    );
  }

  /// `Registration and Sign In`
  String get learnMore_slides_1_title {
    return Intl.message(
      'Registration and Sign In',
      name: 'learnMore_slides_1_title',
      desc: '',
      args: [],
    );
  }

  /// `Your admin will upload your email to the system. Once registered, you can log in to your account.`
  String get learnMore_slides_1_content_1 {
    return Intl.message(
      'Your admin will upload your email to the system. Once registered, you can log in to your account.',
      name: 'learnMore_slides_1_content_1',
      desc: '',
      args: [],
    );
  }

  /// `Use your registered email to access the platform. If it's your first time, you can reset your password as needed.`
  String get learnMore_slides_1_content_2 {
    return Intl.message(
      'Use your registered email to access the platform. If it\'s your first time, you can reset your password as needed.',
      name: 'learnMore_slides_1_content_2',
      desc: '',
      args: [],
    );
  }

  /// `User Profile Setup`
  String get learnMore_slides_2_title {
    return Intl.message(
      'User Profile Setup',
      name: 'learnMore_slides_2_title',
      desc: '',
      args: [],
    );
  }

  /// `Complete your profile with required information.`
  String get learnMore_slides_2_content_1 {
    return Intl.message(
      'Complete your profile with required information.',
      name: 'learnMore_slides_2_content_1',
      desc: '',
      args: [],
    );
  }

  /// `Upload a profile picture and add your contact details.`
  String get learnMore_slides_2_content_2 {
    return Intl.message(
      'Upload a profile picture and add your contact details.',
      name: 'learnMore_slides_2_content_2',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard Overview`
  String get learnMore_slides_3_title {
    return Intl.message(
      'Dashboard Overview',
      name: 'learnMore_slides_3_title',
      desc: '',
      args: [],
    );
  }

  /// `Access all features from your personalized dashboard.`
  String get learnMore_slides_3_content_1 {
    return Intl.message(
      'Access all features from your personalized dashboard.',
      name: 'learnMore_slides_3_content_1',
      desc: '',
      args: [],
    );
  }

  /// `View analytics and reports in real-time.`
  String get learnMore_slides_3_content_2 {
    return Intl.message(
      'View analytics and reports in real-time.',
      name: 'learnMore_slides_3_content_2',
      desc: '',
      args: [],
    );
  }

  /// `Getting Support`
  String get learnMore_slides_4_title {
    return Intl.message(
      'Getting Support',
      name: 'learnMore_slides_4_title',
      desc: '',
      args: [],
    );
  }

  /// `Contact support team for any assistance.`
  String get learnMore_slides_4_content_1 {
    return Intl.message(
      'Contact support team for any assistance.',
      name: 'learnMore_slides_4_content_1',
      desc: '',
      args: [],
    );
  }

  /// `Browse FAQ section for quick answers.`
  String get learnMore_slides_4_content_2 {
    return Intl.message(
      'Browse FAQ section for quick answers.',
      name: 'learnMore_slides_4_content_2',
      desc: '',
      args: [],
    );
  }

  /// `Add New Job`
  String get chooseJob_addJob {
    return Intl.message(
      'Add New Job',
      name: 'chooseJob_addJob',
      desc: '',
      args: [],
    );
  }

  /// `Choose job type`
  String get chooseJob_chooseType {
    return Intl.message(
      'Choose job type',
      name: 'chooseJob_chooseType',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get chooseJob_back {
    return Intl.message('Back', name: 'chooseJob_back', desc: '', args: []);
  }

  /// `Next`
  String get chooseJob_next {
    return Intl.message('Next', name: 'chooseJob_next', desc: '', args: []);
  }

  /// `Please select the appropriate type to ensure it is categorized correctly. Here are the options:`
  String get chooseJob_instructions {
    return Intl.message(
      'Please select the appropriate type to ensure it is categorized correctly. Here are the options:',
      name: 'chooseJob_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Freelancing job on platform`
  String get chooseJob_types_platform_label {
    return Intl.message(
      'Freelancing job on platform',
      name: 'chooseJob_types_platform_label',
      desc: '',
      args: [],
    );
  }

  /// `Select this option if the job is posted on freelancing platforms like Mostaql,\nKhamsat,\nUpwork, etc.\nThese jobs typically involve working through a third-party site that handles payments and communications.`
  String get chooseJob_types_platform_description {
    return Intl.message(
      'Select this option if the job is posted on freelancing platforms like Mostaql,\nKhamsat,\nUpwork, etc.\nThese jobs typically involve working through a third-party site that handles payments and communications.',
      name: 'chooseJob_types_platform_description',
      desc: '',
      args: [],
    );
  }

  /// `Freelancing job with direct contact`
  String get chooseJob_types_direct_label {
    return Intl.message(
      'Freelancing job with direct contact',
      name: 'chooseJob_types_direct_label',
      desc: '',
      args: [],
    );
  }

  /// `Choose this if the job comes from your personal network, such as connections on LinkedIn or referrals. These jobs often involve direct communication with the client without a middleman.`
  String get chooseJob_types_direct_description {
    return Intl.message(
      'Choose this if the job comes from your personal network, such as connections on LinkedIn or referrals. These jobs often involve direct communication with the client without a middleman.',
      name: 'chooseJob_types_direct_description',
      desc: '',
      args: [],
    );
  }

  /// `Remote monthly job`
  String get chooseJob_types_remote_label {
    return Intl.message(
      'Remote monthly job',
      name: 'chooseJob_types_remote_label',
      desc: '',
      args: [],
    );
  }

  /// `Use this option for traditional remote positions that offer a monthly salary. These jobs may have structured hours and responsibilities similar to in-office roles.`
  String get chooseJob_types_remote_description {
    return Intl.message(
      'Use this option for traditional remote positions that offer a monthly salary. These jobs may have structured hours and responsibilities similar to in-office roles.',
      name: 'chooseJob_types_remote_description',
      desc: '',
      args: [],
    );
  }

  /// `Deletion Confirmation`
  String get deleteModal_title {
    return Intl.message(
      'Deletion Confirmation',
      name: 'deleteModal_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this {item}? This action cannot be undone, and all associated data will be permanently removed.`
  String deleteModal_message(Object item) {
    return Intl.message(
      'Are you sure you want to delete this $item? This action cannot be undone, and all associated data will be permanently removed.',
      name: 'deleteModal_message',
      desc: '',
      args: [item],
    );
  }

  /// `job`
  String get deleteModal_job {
    return Intl.message('job', name: 'deleteModal_job', desc: '', args: []);
  }

  /// `certificate`
  String get deleteModal_certificate {
    return Intl.message(
      'certificate',
      name: 'deleteModal_certificate',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get deleteModal_cancel {
    return Intl.message(
      'Cancel',
      name: 'deleteModal_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deleteModal_delete {
    return Intl.message(
      'Delete',
      name: 'deleteModal_delete',
      desc: '',
      args: [],
    );
  }

  /// `Remote monthly job`
  String get remoteForm_title {
    return Intl.message(
      'Remote monthly job',
      name: 'remoteForm_title',
      desc: '',
      args: [],
    );
  }

  /// `Job Title`
  String get remoteForm_jobTitle_placeholder {
    return Intl.message(
      'Job Title',
      name: 'remoteForm_jobTitle_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get remoteForm_jobTitle_required {
    return Intl.message(
      'Required',
      name: 'remoteForm_jobTitle_required',
      desc: '',
      args: [],
    );
  }

  /// `Ensure that the title clearly describes the Job.`
  String get remoteForm_jobTitle_desc {
    return Intl.message(
      'Ensure that the title clearly describes the Job.',
      name: 'remoteForm_jobTitle_desc',
      desc: '',
      args: [],
    );
  }

  /// `Job Description`
  String get remoteForm_jobDescription_placeholder {
    return Intl.message(
      'Job Description',
      name: 'remoteForm_jobDescription_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get remoteForm_jobDescription_required {
    return Intl.message(
      'Required',
      name: 'remoteForm_jobDescription_required',
      desc: '',
      args: [],
    );
  }

  /// `Ensure that the description clearly describes the Job.`
  String get remoteForm_jobDescription_desc {
    return Intl.message(
      'Ensure that the description clearly describes the Job.',
      name: 'remoteForm_jobDescription_desc',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get remoteForm_startDate_placeholder {
    return Intl.message(
      'Start Date',
      name: 'remoteForm_startDate_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get remoteForm_startDate_required {
    return Intl.message(
      'Required',
      name: 'remoteForm_startDate_required',
      desc: '',
      args: [],
    );
  }

  /// `Payment in USD`
  String get remoteForm_paymentInUSD_placeholder {
    return Intl.message(
      'Payment in USD',
      name: 'remoteForm_paymentInUSD_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get remoteForm_paymentInUSD_required {
    return Intl.message(
      'Required',
      name: 'remoteForm_paymentInUSD_required',
      desc: '',
      args: [],
    );
  }

  /// `Payment in EGP`
  String get remoteForm_paymentInEGP_placeholder {
    return Intl.message(
      'Payment in EGP',
      name: 'remoteForm_paymentInEGP_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Auto Generated`
  String get remoteForm_paymentInEGP_required {
    return Intl.message(
      'Auto Generated',
      name: 'remoteForm_paymentInEGP_required',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get remoteForm_companyName_placeholder {
    return Intl.message(
      'Company Name',
      name: 'remoteForm_companyName_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get remoteForm_companyName_required {
    return Intl.message(
      'Required',
      name: 'remoteForm_companyName_required',
      desc: '',
      args: [],
    );
  }

  /// `Company Country`
  String get remoteForm_companyCountry_placeholder {
    return Intl.message(
      'Company Country',
      name: 'remoteForm_companyCountry_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get remoteForm_companyCountry_required {
    return Intl.message(
      'Required',
      name: 'remoteForm_companyCountry_required',
      desc: '',
      args: [],
    );
  }

  /// `Company Contact`
  String get remoteForm_companyContact_placeholder {
    return Intl.message(
      'Company Contact',
      name: 'remoteForm_companyContact_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get remoteForm_companyContact_required {
    return Intl.message(
      'Required',
      name: 'remoteForm_companyContact_required',
      desc: '',
      args: [],
    );
  }

  /// `Make sure the contact information is up-to-date and accurate.`
  String get remoteForm_companyContact_desc {
    return Intl.message(
      'Make sure the contact information is up-to-date and accurate.',
      name: 'remoteForm_companyContact_desc',
      desc: '',
      args: [],
    );
  }

  /// `Proof of Work`
  String get remoteForm_proofOfWork_placeholder {
    return Intl.message(
      'Proof of Work',
      name: 'remoteForm_proofOfWork_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get remoteForm_proofOfWork_required {
    return Intl.message(
      'Required',
      name: 'remoteForm_proofOfWork_required',
      desc: '',
      args: [],
    );
  }

  /// `Prepare a PDF document that includes screenshots of communication with the company (such as emails, chat messages, or meeting summaries), examples or summaries of the work you performed remotely, and proof of payment such as salary slips, bank transfer confirmations, or invoices. Once you have compiled all the materials into a single PDF, upload it to Google Drive, copy the sharing link, and paste it here. Make sure the link is set to Anyone with the link can view so the admin team can access and review it.`
  String get remoteForm_proofOfWork_desc {
    return Intl.message(
      'Prepare a PDF document that includes screenshots of communication with the company (such as emails, chat messages, or meeting summaries), examples or summaries of the work you performed remotely, and proof of payment such as salary slips, bank transfer confirmations, or invoices. Once you have compiled all the materials into a single PDF, upload it to Google Drive, copy the sharing link, and paste it here. Make sure the link is set to Anyone with the link can view so the admin team can access and review it.',
      name: 'remoteForm_proofOfWork_desc',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get remoteForm_buttons_back {
    return Intl.message(
      'Back',
      name: 'remoteForm_buttons_back',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get remoteForm_buttons_add {
    return Intl.message(
      'Add',
      name: 'remoteForm_buttons_add',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get remoteForm_buttons_update {
    return Intl.message(
      'Update',
      name: 'remoteForm_buttons_update',
      desc: '',
      args: [],
    );
  }

  /// `Freelancing job with direct contact`
  String get directForm_title {
    return Intl.message(
      'Freelancing job with direct contact',
      name: 'directForm_title',
      desc: '',
      args: [],
    );
  }

  /// `Job Title`
  String get directForm_jobTitle_placeholder {
    return Intl.message(
      'Job Title',
      name: 'directForm_jobTitle_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get directForm_jobTitle_required {
    return Intl.message(
      'Required',
      name: 'directForm_jobTitle_required',
      desc: '',
      args: [],
    );
  }

  /// `Ensure that the title clearly describes the Job.`
  String get directForm_jobTitle_desc {
    return Intl.message(
      'Ensure that the title clearly describes the Job.',
      name: 'directForm_jobTitle_desc',
      desc: '',
      args: [],
    );
  }

  /// `Job Description`
  String get directForm_jobDescription_placeholder {
    return Intl.message(
      'Job Description',
      name: 'directForm_jobDescription_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get directForm_jobDescription_required {
    return Intl.message(
      'Required',
      name: 'directForm_jobDescription_required',
      desc: '',
      args: [],
    );
  }

  /// `Ensure that the description clearly describes the Job.`
  String get directForm_jobDescription_desc {
    return Intl.message(
      'Ensure that the description clearly describes the Job.',
      name: 'directForm_jobDescription_desc',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get directForm_startDate_placeholder {
    return Intl.message(
      'Start Date',
      name: 'directForm_startDate_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get directForm_startDate_required {
    return Intl.message(
      'Required',
      name: 'directForm_startDate_required',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get directForm_endDate_placeholder {
    return Intl.message(
      'End Date',
      name: 'directForm_endDate_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get directForm_endDate_required {
    return Intl.message(
      'Required',
      name: 'directForm_endDate_required',
      desc: '',
      args: [],
    );
  }

  /// `Cost in USD`
  String get directForm_costInUSD_placeholder {
    return Intl.message(
      'Cost in USD',
      name: 'directForm_costInUSD_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get directForm_costInUSD_required {
    return Intl.message(
      'Required',
      name: 'directForm_costInUSD_required',
      desc: '',
      args: [],
    );
  }

  /// `Cost in EGP`
  String get directForm_costInEGP_placeholder {
    return Intl.message(
      'Cost in EGP',
      name: 'directForm_costInEGP_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Auto Generated`
  String get directForm_costInEGP_required {
    return Intl.message(
      'Auto Generated',
      name: 'directForm_costInEGP_required',
      desc: '',
      args: [],
    );
  }

  /// `Team members`
  String get directForm_teamMembers_placeholder {
    return Intl.message(
      'Team members',
      name: 'directForm_teamMembers_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `optional`
  String get directForm_teamMembers_required {
    return Intl.message(
      'optional',
      name: 'directForm_teamMembers_required',
      desc: '',
      args: [],
    );
  }

  /// `Platform`
  String get directForm_platform_placeholder {
    return Intl.message(
      'Platform',
      name: 'directForm_platform_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get directForm_platform_required {
    return Intl.message(
      'Required',
      name: 'directForm_platform_required',
      desc: '',
      args: [],
    );
  }

  /// `Client Name`
  String get directForm_clientName_placeholder {
    return Intl.message(
      'Client Name',
      name: 'directForm_clientName_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get directForm_clientName_required {
    return Intl.message(
      'Required',
      name: 'directForm_clientName_required',
      desc: '',
      args: [],
    );
  }

  /// `Client Country`
  String get directForm_clientCountry_placeholder {
    return Intl.message(
      'Client Country',
      name: 'directForm_clientCountry_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get directForm_clientCountry_required {
    return Intl.message(
      'Required',
      name: 'directForm_clientCountry_required',
      desc: '',
      args: [],
    );
  }

  /// `Client Contact`
  String get directForm_clientContact_placeholder {
    return Intl.message(
      'Client Contact',
      name: 'directForm_clientContact_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get directForm_clientContact_required {
    return Intl.message(
      'Required',
      name: 'directForm_clientContact_required',
      desc: '',
      args: [],
    );
  }

  /// `Make sure to include either the client's profile link on the platform or their contact number.`
  String get directForm_clientContact_desc {
    return Intl.message(
      'Make sure to include either the client\'s profile link on the platform or their contact number.',
      name: 'directForm_clientContact_desc',
      desc: '',
      args: [],
    );
  }

  /// `Proof of Work`
  String get directForm_proofOfWork_placeholder {
    return Intl.message(
      'Proof of Work',
      name: 'directForm_proofOfWork_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get directForm_proofOfWork_required {
    return Intl.message(
      'Required',
      name: 'directForm_proofOfWork_required',
      desc: '',
      args: [],
    );
  }

  /// `Prepare a PDF document that includes screenshots of chats between you and the client, samples of the work completed, and proof of payment or invoices. Once you've compiled everything into a single PDF, upload it to Google Drive, copy the link, and paste it in here. Make sure the link is set to 'Anyone with the link can view' so that admin can access it.`
  String get directForm_proofOfWork_desc {
    return Intl.message(
      'Prepare a PDF document that includes screenshots of chats between you and the client, samples of the work completed, and proof of payment or invoices. Once you\'ve compiled everything into a single PDF, upload it to Google Drive, copy the link, and paste it in here. Make sure the link is set to \'Anyone with the link can view\' so that admin can access it.',
      name: 'directForm_proofOfWork_desc',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get directForm_buttons_back {
    return Intl.message(
      'Back',
      name: 'directForm_buttons_back',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get directForm_buttons_add {
    return Intl.message(
      'Add',
      name: 'directForm_buttons_add',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get directForm_buttons_update {
    return Intl.message(
      'Update',
      name: 'directForm_buttons_update',
      desc: '',
      args: [],
    );
  }

  /// `Freelancing job on platform`
  String get platformForm_title {
    return Intl.message(
      'Freelancing job on platform',
      name: 'platformForm_title',
      desc: '',
      args: [],
    );
  }

  /// `Job Title`
  String get platformForm_jobTitle_placeholder {
    return Intl.message(
      'Job Title',
      name: 'platformForm_jobTitle_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get platformForm_jobTitle_required {
    return Intl.message(
      'Required',
      name: 'platformForm_jobTitle_required',
      desc: '',
      args: [],
    );
  }

  /// `Ensure that the title clearly describes the Job.`
  String get platformForm_jobTitle_desc {
    return Intl.message(
      'Ensure that the title clearly describes the Job.',
      name: 'platformForm_jobTitle_desc',
      desc: '',
      args: [],
    );
  }

  /// `Job Description`
  String get platformForm_jobDescription_placeholder {
    return Intl.message(
      'Job Description',
      name: 'platformForm_jobDescription_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get platformForm_jobDescription_required {
    return Intl.message(
      'Required',
      name: 'platformForm_jobDescription_required',
      desc: '',
      args: [],
    );
  }

  /// `Ensure that the description clearly describes the Job.`
  String get platformForm_jobDescription_desc {
    return Intl.message(
      'Ensure that the description clearly describes the Job.',
      name: 'platformForm_jobDescription_desc',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get platformForm_startDate_placeholder {
    return Intl.message(
      'Start Date',
      name: 'platformForm_startDate_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get endDateLabel {
    return Intl.message('End Date', name: 'endDateLabel', desc: '', args: []);
  }

  /// `Required`
  String get platformForm_startDate_required {
    return Intl.message(
      'Required',
      name: 'platformForm_startDate_required',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get platformForm_endDate_placeholder {
    return Intl.message(
      'End Date',
      name: 'platformForm_endDate_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get platformForm_endDate_required {
    return Intl.message(
      'Required',
      name: 'platformForm_endDate_required',
      desc: '',
      args: [],
    );
  }

  /// `Cost in USD`
  String get platformForm_costInUSD_placeholder {
    return Intl.message(
      'Cost in USD',
      name: 'platformForm_costInUSD_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get platformForm_costInUSD_required {
    return Intl.message(
      'Required',
      name: 'platformForm_costInUSD_required',
      desc: '',
      args: [],
    );
  }

  /// `Cost in EGP`
  String get platformForm_costInEGP_placeholder {
    return Intl.message(
      'Cost in EGP',
      name: 'platformForm_costInEGP_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Auto Generated`
  String get platformForm_costInEGP_required {
    return Intl.message(
      'Auto Generated',
      name: 'platformForm_costInEGP_required',
      desc: '',
      args: [],
    );
  }

  /// `Team members`
  String get platformForm_teamMembers_placeholder {
    return Intl.message(
      'Team members',
      name: 'platformForm_teamMembers_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `optional`
  String get platformForm_teamMembers_required {
    return Intl.message(
      'optional',
      name: 'platformForm_teamMembers_required',
      desc: '',
      args: [],
    );
  }

  /// `Platform`
  String get platformForm_platform_placeholder {
    return Intl.message(
      'Platform',
      name: 'platformForm_platform_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get platformForm_platform_required {
    return Intl.message(
      'Required',
      name: 'platformForm_platform_required',
      desc: '',
      args: [],
    );
  }

  /// `Your Profile on The Platform`
  String get platformForm_studentProfile_placeholder {
    return Intl.message(
      'Your Profile on The Platform',
      name: 'platformForm_studentProfile_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get platformForm_studentProfile_required {
    return Intl.message(
      'Required',
      name: 'platformForm_studentProfile_required',
      desc: '',
      args: [],
    );
  }

  /// `Provide the link to your profile on the chosen platform.`
  String get platformForm_studentProfile_desc {
    return Intl.message(
      'Provide the link to your profile on the chosen platform.',
      name: 'platformForm_studentProfile_desc',
      desc: '',
      args: [],
    );
  }

  /// `Client Name`
  String get platformForm_clientName_placeholder {
    return Intl.message(
      'Client Name',
      name: 'platformForm_clientName_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get platformForm_clientName_required {
    return Intl.message(
      'Required',
      name: 'platformForm_clientName_required',
      desc: '',
      args: [],
    );
  }

  /// `Client Country`
  String get platformForm_clientCountry_placeholder {
    return Intl.message(
      'Client Country',
      name: 'platformForm_clientCountry_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get platformForm_clientCountry_required {
    return Intl.message(
      'Required',
      name: 'platformForm_clientCountry_required',
      desc: '',
      args: [],
    );
  }

  /// `Client Profile on The Platform`
  String get platformForm_clientProfile_placeholder {
    return Intl.message(
      'Client Profile on The Platform',
      name: 'platformForm_clientProfile_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get platformForm_clientProfile_required {
    return Intl.message(
      'Required',
      name: 'platformForm_clientProfile_required',
      desc: '',
      args: [],
    );
  }

  /// `Ensure to put the link to the client's profile on the chosen platform.`
  String get platformForm_clientProfile_desc {
    return Intl.message(
      'Ensure to put the link to the client\'s profile on the chosen platform.',
      name: 'platformForm_clientProfile_desc',
      desc: '',
      args: [],
    );
  }

  /// `Proof of Work`
  String get platformForm_proofOfWork_placeholder {
    return Intl.message(
      'Proof of Work',
      name: 'platformForm_proofOfWork_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get platformForm_proofOfWork_required {
    return Intl.message(
      'Required',
      name: 'platformForm_proofOfWork_required',
      desc: '',
      args: [],
    );
  }

  /// `Prepare a PDF document that includes screenshots of chats between you and the client, samples of the work completed, and proof of payment or invoices. Once you've compiled everything into a single PDF, upload it to Google Drive, copy the link, and paste it in here. Make sure the link is set to 'Anyone with the link can view' so that admin can access it.`
  String get platformForm_proofOfWork_desc {
    return Intl.message(
      'Prepare a PDF document that includes screenshots of chats between you and the client, samples of the work completed, and proof of payment or invoices. Once you\'ve compiled everything into a single PDF, upload it to Google Drive, copy the link, and paste it in here. Make sure the link is set to \'Anyone with the link can view\' so that admin can access it.',
      name: 'platformForm_proofOfWork_desc',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get platformForm_buttons_back {
    return Intl.message(
      'Back',
      name: 'platformForm_buttons_back',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get platformForm_buttons_add {
    return Intl.message(
      'Add',
      name: 'platformForm_buttons_add',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get platformForm_buttons_update {
    return Intl.message(
      'Update',
      name: 'platformForm_buttons_update',
      desc: '',
      args: [],
    );
  }

  /// `Add New Certificate`
  String get certificateForm_title {
    return Intl.message(
      'Add New Certificate',
      name: 'certificateForm_title',
      desc: '',
      args: [],
    );
  }

  /// `Certificate ID`
  String get certificateForm_certificateId_placeholder {
    return Intl.message(
      'Certificate ID',
      name: 'certificateForm_certificateId_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get certificateForm_certificateId_required {
    return Intl.message(
      'Required',
      name: 'certificateForm_certificateId_required',
      desc: '',
      args: [],
    );
  }

  /// `Ensure that the Certificate ID is Right.`
  String get certificateForm_certificateId_desc {
    return Intl.message(
      'Ensure that the Certificate ID is Right.',
      name: 'certificateForm_certificateId_desc',
      desc: '',
      args: [],
    );
  }

  /// `Certificate Description`
  String get certificateForm_certificateDescription_placeholder {
    return Intl.message(
      'Certificate Description',
      name: 'certificateForm_certificateDescription_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get certificateForm_certificateDescription_required {
    return Intl.message(
      'Required',
      name: 'certificateForm_certificateDescription_required',
      desc: '',
      args: [],
    );
  }

  /// `Ensure that the description clearly describes the certificate.`
  String get certificateForm_certificateDescription_desc {
    return Intl.message(
      'Ensure that the description clearly describes the certificate.',
      name: 'certificateForm_certificateDescription_desc',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get certificateForm_startDate_placeholder {
    return Intl.message(
      'Start Date',
      name: 'certificateForm_startDate_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get certificateForm_startDate_required {
    return Intl.message(
      'Required',
      name: 'certificateForm_startDate_required',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get certificateForm_endDate_placeholder {
    return Intl.message(
      'End Date',
      name: 'certificateForm_endDate_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get certificateForm_endDate_required {
    return Intl.message(
      'Required',
      name: 'certificateForm_endDate_required',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get certificateForm_company_placeholder {
    return Intl.message(
      'Company Name',
      name: 'certificateForm_company_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get certificateForm_company_required {
    return Intl.message(
      'Required',
      name: 'certificateForm_company_required',
      desc: '',
      args: [],
    );
  }

  /// `Course Approach`
  String get certificateForm_approach_placeholder {
    return Intl.message(
      'Course Approach',
      name: 'certificateForm_approach_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get certificateForm_approach_required {
    return Intl.message(
      'Required',
      name: 'certificateForm_approach_required',
      desc: '',
      args: [],
    );
  }

  /// `Proof of Certificate`
  String get certificateForm_proofOfCertificate_placeholder {
    return Intl.message(
      'Proof of Certificate',
      name: 'certificateForm_proofOfCertificate_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get certificateForm_proofOfCertificate_required {
    return Intl.message(
      'Required',
      name: 'certificateForm_proofOfCertificate_required',
      desc: '',
      args: [],
    );
  }

  /// `Upload a scanned copy of the certificate or a photo of the certificate, all the materials into a single PDF, upload it to Google Drive, copy the sharing link, and paste it here. Make sure the link is set to 'Anyone with the link can view' so the admin team can access and review it.`
  String get certificateForm_proofOfCertificate_desc {
    return Intl.message(
      'Upload a scanned copy of the certificate or a photo of the certificate, all the materials into a single PDF, upload it to Google Drive, copy the sharing link, and paste it here. Make sure the link is set to \'Anyone with the link can view\' so the admin team can access and review it.',
      name: 'certificateForm_proofOfCertificate_desc',
      desc: '',
      args: [],
    );
  }

  /// `Proof of Work`
  String get certificateForm_proofOfWork_placeholder {
    return Intl.message(
      'Proof of Work',
      name: 'certificateForm_proofOfWork_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get certificateForm_proofOfWork_required {
    return Intl.message(
      'Required',
      name: 'certificateForm_proofOfWork_required',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get certificateForm_buttons_back {
    return Intl.message(
      'Back',
      name: 'certificateForm_buttons_back',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get certificateForm_buttons_add {
    return Intl.message(
      'Add',
      name: 'certificateForm_buttons_add',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get certificateForm_buttons_update {
    return Intl.message(
      'Update',
      name: 'certificateForm_buttons_update',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations on reaching your target! We are incredibly proud of you and your hard work! This is a fantastic achievement, and we want you to take a moment to celebrate your success. Keep shining and moving forward, you’re doing great!`
  String get congrats_message {
    return Intl.message(
      'Congratulations on reaching your target! We are incredibly proud of you and your hard work! This is a fantastic achievement, and we want you to take a moment to celebrate your success. Keep shining and moving forward, you’re doing great!',
      name: 'congrats_message',
      desc: '',
      args: [],
    );
  }

  /// `Track`
  String get topCards_track {
    return Intl.message('Track', name: 'topCards_track', desc: '', args: []);
  }

  /// `Total Jobs`
  String get topCards_totalJobs {
    return Intl.message(
      'Total Jobs',
      name: 'topCards_totalJobs',
      desc: '',
      args: [],
    );
  }

  /// `Completed and Approved Jobs`
  String get topCards_completedJobs {
    return Intl.message(
      'Completed and Approved Jobs',
      name: 'topCards_completedJobs',
      desc: '',
      args: [],
    );
  }

  /// `Total Profit Earned (USD)`
  String get topCards_profitUSD {
    return Intl.message(
      'Total Profit Earned (USD)',
      name: 'topCards_profitUSD',
      desc: '',
      args: [],
    );
  }

  /// `Total Profit Earned (EGP)`
  String get topCards_profitEGP {
    return Intl.message(
      'Total Profit Earned (EGP)',
      name: 'topCards_profitEGP',
      desc: '',
      args: [],
    );
  }

  /// `Uploaded Certificates`
  String get topCards_certificates {
    return Intl.message(
      'Uploaded Certificates',
      name: 'topCards_certificates',
      desc: '',
      args: [],
    );
  }

  /// `Certificate Added Successfully`
  String get addedModal_addedCerTitle {
    return Intl.message(
      'Certificate Added Successfully',
      name: 'addedModal_addedCerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Certificate Updated Successfully`
  String get addedModal_updatedCerTitle {
    return Intl.message(
      'Certificate Updated Successfully',
      name: 'addedModal_updatedCerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Certificate has been submitted successfully and will be reviewed by the admin. You will be notified once it has been checked.`
  String get addedModal_addedCerMessage {
    return Intl.message(
      'Your Certificate has been submitted successfully and will be reviewed by the admin. You will be notified once it has been checked.',
      name: 'addedModal_addedCerMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your Certificate has been updated successfully and will be reviewed by the admin. You will be notified once it has been checked.`
  String get addedModal_updatedCerMessage {
    return Intl.message(
      'Your Certificate has been updated successfully and will be reviewed by the admin. You will be notified once it has been checked.',
      name: 'addedModal_updatedCerMessage',
      desc: '',
      args: [],
    );
  }

  /// `Job Added Successfully`
  String get addedModal_addedTitle {
    return Intl.message(
      'Job Added Successfully',
      name: 'addedModal_addedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Job Updated Successfully`
  String get addedModal_updatedTitle {
    return Intl.message(
      'Job Updated Successfully',
      name: 'addedModal_updatedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your job has been submitted successfully and will be reviewed by the admin. You will be notified once it has been checked.`
  String get addedModal_addedMessage {
    return Intl.message(
      'Your job has been submitted successfully and will be reviewed by the admin. You will be notified once it has been checked.',
      name: 'addedModal_addedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your job has been updated successfully and will be reviewed by the admin. You will be notified once it has been checked.`
  String get addedModal_updatedMessage {
    return Intl.message(
      'Your job has been updated successfully and will be reviewed by the admin. You will be notified once it has been checked.',
      name: 'addedModal_updatedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get addedModal_home {
    return Intl.message('Home', name: 'addedModal_home', desc: '', args: []);
  }

  /// `Chat with Admin`
  String get chatWithAdminTitle {
    return Intl.message(
      'Chat with Admin',
      name: 'chatWithAdminTitle',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get backButton {
    return Intl.message('Back', name: 'backButton', desc: '', args: []);
  }

  /// `Welcome! If you have any questions or problems, feel free to chat with our admin here. Just type your message below, and we’ll get back to you as soon as possible. We're here to help!`
  String get chatWelcomeMessage {
    return Intl.message(
      'Welcome! If you have any questions or problems, feel free to chat with our admin here. Just type your message below, and we’ll get back to you as soon as possible. We\'re here to help!',
      name: 'chatWelcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Ask about anything ...`
  String get chatInputHint {
    return Intl.message(
      'Ask about anything ...',
      name: 'chatInputHint',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while loading the chat`
  String get chatError {
    return Intl.message(
      'An error occurred while loading the chat',
      name: 'chatError',
      desc: '',
      args: [],
    );
  }

  /// `Chat with Us!`
  String get chatScreenTitle {
    return Intl.message(
      'Chat with Us!',
      name: 'chatScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `If you have any questions or encounter any issues, you’re in the right place.`
  String get chatScreenMainMessage {
    return Intl.message(
      'If you have any questions or encounter any issues, you’re in the right place.',
      name: 'chatScreenMainMessage',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStartedButton {
    return Intl.message(
      'Get Started',
      name: 'getStartedButton',
      desc: '',
      args: [],
    );
  }

  /// `Add New Job`
  String get addNewJobTitle {
    return Intl.message(
      'Add New Job',
      name: 'addNewJobTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose job type`
  String get chooseJobType {
    return Intl.message(
      'Choose job type',
      name: 'chooseJobType',
      desc: '',
      args: [],
    );
  }

  /// `Freelancing job on platform`
  String get jobTypePlatform {
    return Intl.message(
      'Freelancing job on platform',
      name: 'jobTypePlatform',
      desc: '',
      args: [],
    );
  }

  /// `Freelancing job with direct contact`
  String get jobTypeDirectContact {
    return Intl.message(
      'Freelancing job with direct contact',
      name: 'jobTypeDirectContact',
      desc: '',
      args: [],
    );
  }

  /// `Remote monthly job`
  String get jobTypeRemoteMonthly {
    return Intl.message(
      'Remote monthly job',
      name: 'jobTypeRemoteMonthly',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get nextButton {
    return Intl.message('Next', name: 'nextButton', desc: '', args: []);
  }

  /// `Please select the appropriate type to ensure it is categorized correctly. Here are the options:`
  String get jobTypeInstruction {
    return Intl.message(
      'Please select the appropriate type to ensure it is categorized correctly. Here are the options:',
      name: 'jobTypeInstruction',
      desc: '',
      args: [],
    );
  }

  /// `• Freelancing job on platform: Select this option if the job is posted on freelancing platforms like Mostaql, Khamsat, Upwork, etc. These jobs typically involve working through a third-party site that handles payments and communications.`
  String get jobTypePlatformDescription {
    return Intl.message(
      '• Freelancing job on platform: Select this option if the job is posted on freelancing platforms like Mostaql, Khamsat, Upwork, etc. These jobs typically involve working through a third-party site that handles payments and communications.',
      name: 'jobTypePlatformDescription',
      desc: '',
      args: [],
    );
  }

  /// `• Freelancing job with direct contact: Choose this if the job comes from your personal network, such as connections on LinkedIn or referrals. These jobs often involve direct communication with the client without a middleman.`
  String get jobTypeDirectContactDescription {
    return Intl.message(
      '• Freelancing job with direct contact: Choose this if the job comes from your personal network, such as connections on LinkedIn or referrals. These jobs often involve direct communication with the client without a middleman.',
      name: 'jobTypeDirectContactDescription',
      desc: '',
      args: [],
    );
  }

  /// `• Remote monthly job: Use this option for traditional remote positions that offer a monthly salary. These jobs may have structured hours and responsibilities similar to in-office roles.`
  String get jobTypeRemoteMonthlyDescription {
    return Intl.message(
      '• Remote monthly job: Use this option for traditional remote positions that offer a monthly salary. These jobs may have structured hours and responsibilities similar to in-office roles.',
      name: 'jobTypeRemoteMonthlyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddressHint {
    return Intl.message(
      'Email Address',
      name: 'emailAddressHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordHint {
    return Intl.message('Password', name: 'passwordHint', desc: '', args: []);
  }

  /// `Please enter your email`
  String get emailRequiredError {
    return Intl.message(
      'Please enter your email',
      name: 'emailRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter your password.`
  String get passwordRequiredError {
    return Intl.message(
      'Please, enter your password.',
      name: 'passwordRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMeLabel {
    return Intl.message(
      'Remember me',
      name: 'rememberMeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password ?`
  String get forgotPasswordLink {
    return Intl.message(
      'Forgot your password ?',
      name: 'forgotPasswordLink',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signInButton {
    return Intl.message('Sign In', name: 'signInButton', desc: '', args: []);
  }

  /// `If your email is not registered, please contact the admin in your branch for assistance.`
  String get emailNotRegisteredMessage {
    return Intl.message(
      'If your email is not registered, please contact the admin in your branch for assistance.',
      name: 'emailNotRegisteredMessage',
      desc: '',
      args: [],
    );
  }

  /// `Click here to explore features, benefits, and how to make the most of your experience`
  String get exploreFeaturesText {
    return Intl.message(
      'Click here to explore features, benefits, and how to make the most of your experience',
      name: 'exploreFeaturesText',
      desc: '',
      args: [],
    );
  }

  /// `Learn More`
  String get learnMoreLink {
    return Intl.message(
      'Learn More',
      name: 'learnMoreLink',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBackMessage {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBackMessage',
      desc: '',
      args: [],
    );
  }

  /// `No Name`
  String get defaultUserName {
    return Intl.message('No Name', name: 'defaultUserName', desc: '', args: []);
  }

  /// `Track`
  String get trackLabel {
    return Intl.message('Track', name: 'trackLabel', desc: '', args: []);
  }

  /// `No Track`
  String get defaultTrackName {
    return Intl.message(
      'No Track',
      name: 'defaultTrackName',
      desc: '',
      args: [],
    );
  }

  /// `Total Jobs:`
  String get totalJobsLabel {
    return Intl.message(
      'Total Jobs:',
      name: 'totalJobsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Completed and Approved Jobs`
  String get completedJobsLabel {
    return Intl.message(
      'Completed and Approved Jobs',
      name: 'completedJobsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Total Profit Earned (USD)`
  String get totalProfitUSDLabel {
    return Intl.message(
      'Total Profit Earned (USD)',
      name: 'totalProfitUSDLabel',
      desc: '',
      args: [],
    );
  }

  /// `Total Profit Earned (EGP):`
  String get totalProfitEGPLabel {
    return Intl.message(
      'Total Profit Earned (EGP):',
      name: 'totalProfitEGPLabel',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get currencyEGP {
    return Intl.message('EGP', name: 'currencyEGP', desc: '', args: []);
  }

  /// `Congratulations on reaching your target! We are incredibly proud of you and your hard work! This is a fantastic achievement, and we want you to take a moment to celebrate your success. Keep shining and moving forward, you’re doing great!`
  String get targetReachedMessage {
    return Intl.message(
      'Congratulations on reaching your target! We are incredibly proud of you and your hard work! This is a fantastic achievement, and we want you to take a moment to celebrate your success. Keep shining and moving forward, you’re doing great!',
      name: 'targetReachedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error occurred`
  String get errorOccurredMessage {
    return Intl.message(
      'Error occurred',
      name: 'errorOccurredMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error loading certificates`
  String get errorLoadingCertificates {
    return Intl.message(
      'Error loading certificates',
      name: 'errorLoadingCertificates',
      desc: '',
      args: [],
    );
  }

  /// `No certificates available`
  String get noCertificatesAvailable {
    return Intl.message(
      'No certificates available',
      name: 'noCertificatesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `{company}'s Certificate`
  String certificateTitle(Object company) {
    return Intl.message(
      '$company\'s Certificate',
      name: 'certificateTitle',
      desc: '',
      args: [company],
    );
  }

  /// `Start:`
  String get startDateLabel {
    return Intl.message('Start:', name: 'startDateLabel', desc: '', args: []);
  }

  /// `Completion:`
  String get completionDateLabel {
    return Intl.message(
      'Completion:',
      name: 'completionDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Error loading jobs`
  String get errorLoadingJobs {
    return Intl.message(
      'Error loading jobs',
      name: 'errorLoadingJobs',
      desc: '',
      args: [],
    );
  }

  /// `No jobs available`
  String get noJobsAvailable {
    return Intl.message(
      'No jobs available',
      name: 'noJobsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No Title`
  String get defaultJobTitle {
    return Intl.message(
      'No Title',
      name: 'defaultJobTitle',
      desc: '',
      args: [],
    );
  }

  /// `No platform available`
  String get defaultPlatform {
    return Intl.message(
      'No platform available',
      name: 'defaultPlatform',
      desc: '',
      args: [],
    );
  }

  /// `No description available`
  String get defaultDescription {
    return Intl.message(
      'No description available',
      name: 'defaultDescription',
      desc: '',
      args: [],
    );
  }

  /// `Contributors: `
  String get contributorsLabel {
    return Intl.message(
      'Contributors: ',
      name: 'contributorsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknownContributor {
    return Intl.message(
      'Unknown',
      name: 'unknownContributor',
      desc: '',
      args: [],
    );
  }

  /// `USD`
  String get currencyUSD {
    return Intl.message('USD', name: 'currencyUSD', desc: '', args: []);
  }

  /// `Comments`
  String get commentsLabel {
    return Intl.message('Comments', name: 'commentsLabel', desc: '', args: []);
  }

  /// `Add Note`
  String get addNoteLink {
    return Intl.message('Add Note', name: 'addNoteLink', desc: '', args: []);
  }

  /// `Email Address`
  String get emailHint {
    return Intl.message('Email Address', name: 'emailHint', desc: '', args: []);
  }

  /// `Please enter your email`
  String get emailRequired {
    return Intl.message(
      'Please enter your email',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter your password.`
  String get passwordRequired {
    return Intl.message(
      'Please, enter your password.',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email and Password cannot be empty`
  String get emptyCredentialsError {
    return Intl.message(
      'Email and Password cannot be empty',
      name: 'emptyCredentialsError',
      desc: '',
      args: [],
    );
  }

  /// `If your email is not registered, please contact the admin in your branch for assistance.`
  String get unregisteredEmailMessage {
    return Intl.message(
      'If your email is not registered, please contact the admin in your branch for assistance.',
      name: 'unregisteredEmailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Submitted Successfully!`
  String get submittedSuccessfullyTitle {
    return Intl.message(
      'Submitted Successfully!',
      name: 'submittedSuccessfullyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Changed Successfully!`
  String get changedSuccessfullyTitle {
    return Intl.message(
      'Changed Successfully!',
      name: 'changedSuccessfullyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed successfully. You can now sign in using your new password.`
  String get passwordChangedMessage {
    return Intl.message(
      'Your password has been changed successfully. You can now sign in using your new password.',
      name: 'passwordChangedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePasswordTitle {
    return Intl.message(
      'Change Password',
      name: 'changePasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Current Password`
  String get currentPasswordLabel {
    return Intl.message(
      'Your Current Password',
      name: 'currentPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Your New Password`
  String get newPasswordLabel {
    return Intl.message(
      'Your New Password',
      name: 'newPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Repeat Your New Password`
  String get repeatPasswordLabel {
    return Intl.message(
      'Repeat Your New Password',
      name: 'repeatPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordMinLength {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `If you’ve forgotten your password, simply`
  String get forgotPasswordIntro {
    return Intl.message(
      'If you’ve forgotten your password, simply',
      name: 'forgotPasswordIntro',
      desc: '',
      args: [],
    );
  }

  /// `sign out`
  String get signOutLink {
    return Intl.message('sign out', name: 'signOutLink', desc: '', args: []);
  }

  /// `on the login page to reset it using your registered email address`
  String get resetPasswordInstruction {
    return Intl.message(
      'on the login page to reset it using your registered email address',
      name: 'resetPasswordInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsMismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Password`
  String get wrongPasswordError {
    return Intl.message(
      'Wrong Password',
      name: 'wrongPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been updated. You can now log in with your new password. If you have any issues, feel free to reach out for assistance!`
  String get passwordUpdatedMessage {
    return Intl.message(
      'Your password has been updated. You can now log in with your new password. If you have any issues, feel free to reach out for assistance!',
      name: 'passwordUpdatedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Back to Settings`
  String get backToSettingsButton {
    return Intl.message(
      'Back to Settings',
      name: 'backToSettingsButton',
      desc: '',
      args: [],
    );
  }

  /// `Edit My Profile`
  String get editProfileTitle {
    return Intl.message(
      'Edit My Profile',
      name: 'editProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your personal information is based on what you registered during the training. If you need to update any of this information, please contact the admin for assistance.`
  String get profileInfoMessage {
    return Intl.message(
      'Your personal information is based on what you registered during the training. If you need to update any of this information, please contact the admin for assistance.',
      name: 'profileInfoMessage',
      desc: '',
      args: [],
    );
  }

  /// `Updated successfully!`
  String get updatedSuccessfullyMessage {
    return Intl.message(
      'Updated successfully!',
      name: 'updatedSuccessfullyMessage',
      desc: '',
      args: [],
    );
  }

  /// `Add New Job`
  String get addNewJobButton {
    return Intl.message(
      'Add New Job',
      name: 'addNewJobButton',
      desc: '',
      args: [],
    );
  }

  /// `If you notice any discrepancies in the numbers or data displayed, please feel free to reach out to the admin through the`
  String get contactAdminIntro {
    return Intl.message(
      'If you notice any discrepancies in the numbers or data displayed, please feel free to reach out to the admin through the',
      name: 'contactAdminIntro',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chatLink {
    return Intl.message('Chat', name: 'chatLink', desc: '', args: []);
  }

  /// `feature for assistance.`
  String get contactAdminOutro {
    return Intl.message(
      'feature for assistance.',
      name: 'contactAdminOutro',
      desc: '',
      args: [],
    );
  }

  /// `certificateId: `
  String get certificateIdLabel {
    return Intl.message(
      'certificateId: ',
      name: 'certificateIdLabel',
      desc: '',
      args: [],
    );
  }

  /// `Description: `
  String get descriptionLabel {
    return Intl.message(
      'Description: ',
      name: 'descriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Student Name`
  String get studentNameLabel {
    return Intl.message(
      'Student Name',
      name: 'studentNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `branch: `
  String get branchLabel {
    return Intl.message('branch: ', name: 'branchLabel', desc: '', args: []);
  }

  /// `Company:`
  String get companyLabel {
    return Intl.message('Company:', name: 'companyLabel', desc: '', args: []);
  }

  /// `approach:`
  String get approachLabel {
    return Intl.message('approach:', name: 'approachLabel', desc: '', args: []);
  }

  /// `proofOfCertificate: `
  String get proofOfCertificateLabel {
    return Intl.message(
      'proofOfCertificate: ',
      name: 'proofOfCertificateLabel',
      desc: '',
      args: [],
    );
  }

  /// `View Certificate`
  String get viewCertificateButton {
    return Intl.message(
      'View Certificate',
      name: 'viewCertificateButton',
      desc: '',
      args: [],
    );
  }

  /// `Open Link`
  String get openLinkButton {
    return Intl.message(
      'Open Link',
      name: 'openLinkButton',
      desc: '',
      args: [],
    );
  }

  /// `Certificate Deletion Confirmation`
  String get certificateDeletionTitle {
    return Intl.message(
      'Certificate Deletion Confirmation',
      name: 'certificateDeletionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this certificate? This action cannot be undone.`
  String get certificateDeletionMessage {
    return Intl.message(
      'Are you sure you want to delete this certificate? This action cannot be undone.',
      name: 'certificateDeletionMessage',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmButton {
    return Intl.message('Confirm', name: 'confirmButton', desc: '', args: []);
  }

  /// `Certificate deleted successfully`
  String get certificateDeletedSuccess {
    return Intl.message(
      'Certificate deleted successfully',
      name: 'certificateDeletedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete certificate`
  String get certificateDeletionFailed {
    return Intl.message(
      'Failed to delete certificate',
      name: 'certificateDeletionFailed',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deleteButton {
    return Intl.message('Delete', name: 'deleteButton', desc: '', args: []);
  }

  /// `Edit`
  String get editButton {
    return Intl.message('Edit', name: 'editButton', desc: '', args: []);
  }

  /// `Accepted`
  String get acceptedStatus {
    return Intl.message('Accepted', name: 'acceptedStatus', desc: '', args: []);
  }

  /// `Pending`
  String get pendingStatus {
    return Intl.message('Pending', name: 'pendingStatus', desc: '', args: []);
  }

  /// `Company Name`
  String get companyNameLabel {
    return Intl.message(
      'Company Name',
      name: 'companyNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `companyCountry`
  String get companyCountryLabel {
    return Intl.message(
      'companyCountry',
      name: 'companyCountryLabel',
      desc: '',
      args: [],
    );
  }

  /// `companyContact`
  String get companyContactLabel {
    return Intl.message(
      'companyContact',
      name: 'companyContactLabel',
      desc: '',
      args: [],
    );
  }

  /// `proofOfWork`
  String get proofOfWorkLabel {
    return Intl.message(
      'proofOfWork',
      name: 'proofOfWorkLabel',
      desc: '',
      args: [],
    );
  }

  /// `Client Name`
  String get clientNameLabel {
    return Intl.message(
      'Client Name',
      name: 'clientNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Client Country`
  String get clientCountryLabel {
    return Intl.message(
      'Client Country',
      name: 'clientCountryLabel',
      desc: '',
      args: [],
    );
  }

  /// `Platform`
  String get platformLabel {
    return Intl.message('Platform', name: 'platformLabel', desc: '', args: []);
  }

  /// `Student Profile`
  String get studentProfileLabel {
    return Intl.message(
      'Student Profile',
      name: 'studentProfileLabel',
      desc: '',
      args: [],
    );
  }

  /// `Client Profile on The Platform`
  String get clientProfileLabel {
    return Intl.message(
      'Client Profile on The Platform',
      name: 'clientProfileLabel',
      desc: '',
      args: [],
    );
  }

  /// `No Comments Yet`
  String get noCommentsMessage {
    return Intl.message(
      'No Comments Yet',
      name: 'noCommentsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Job Deletion Confirmation`
  String get jobDeletionTitle {
    return Intl.message(
      'Job Deletion Confirmation',
      name: 'jobDeletionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this job? This action cannot be undone.`
  String get jobDeletionMessage {
    return Intl.message(
      'Are you sure you want to delete this job? This action cannot be undone.',
      name: 'jobDeletionMessage',
      desc: '',
      args: [],
    );
  }

  /// `Job deleted successfully`
  String get jobDeletedSuccess {
    return Intl.message(
      'Job deleted successfully',
      name: 'jobDeletedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgainMessage {
    return Intl.message(
      'Try Again',
      name: 'tryAgainMessage',
      desc: '',
      args: [],
    );
  }

  /// `View Proof`
  String get viewProofButton {
    return Intl.message(
      'View Proof',
      name: 'viewProofButton',
      desc: '',
      args: [],
    );
  }

  /// `Open Profile`
  String get openProfileButton {
    return Intl.message(
      'Open Profile',
      name: 'openProfileButton',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeTabLabel {
    return Intl.message('Home', name: 'homeTabLabel', desc: '', args: []);
  }

  /// `Chat`
  String get chatTabLabel {
    return Intl.message('Chat', name: 'chatTabLabel', desc: '', args: []);
  }

  /// `Add Job`
  String get addJobTabLabel {
    return Intl.message('Add Job', name: 'addJobTabLabel', desc: '', args: []);
  }

  /// `Settings`
  String get settingsTabLabel {
    return Intl.message(
      'Settings',
      name: 'settingsTabLabel',
      desc: '',
      args: [],
    );
  }

  /// `Job Title`
  String get jobTitleLabel {
    return Intl.message('Job Title', name: 'jobTitleLabel', desc: '', args: []);
  }

  /// `Enter the title of the job`
  String get enterJobTitleHint {
    return Intl.message(
      'Enter the title of the job',
      name: 'enterJobTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter the client's name`
  String get enterClientNameHint {
    return Intl.message(
      'Enter the client\'s name',
      name: 'enterClientNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter the start date`
  String get enterStartDateHint {
    return Intl.message(
      'Enter the start date',
      name: 'enterStartDateHint',
      desc: '',
      args: [],
    );
  }

  /// `DD/MM/YYYY`
  String get dateFormatHint {
    return Intl.message(
      'DD/MM/YYYY',
      name: 'dateFormatHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter the end date`
  String get enterEndDateHint {
    return Intl.message(
      'Enter the end date',
      name: 'enterEndDateHint',
      desc: '',
      args: [],
    );
  }

  /// `Budget`
  String get budgetLabel {
    return Intl.message('Budget', name: 'budgetLabel', desc: '', args: []);
  }

  /// `Enter the budget`
  String get enterBudgetHint {
    return Intl.message(
      'Enter the budget',
      name: 'enterBudgetHint',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currencyLabel {
    return Intl.message('Currency', name: 'currencyLabel', desc: '', args: []);
  }

  /// `Enter the currency`
  String get enterCurrencyHint {
    return Intl.message(
      'Enter the currency',
      name: 'enterCurrencyHint',
      desc: '',
      args: [],
    );
  }

  /// `Team members`
  String get teamMembersLabel {
    return Intl.message(
      'Team members',
      name: 'teamMembersLabel',
      desc: '',
      args: [],
    );
  }

  /// `(optional)`
  String get optionalLabel {
    return Intl.message(
      '(optional)',
      name: 'optionalLabel',
      desc: '',
      args: [],
    );
  }

  /// `Select team members`
  String get selectTeamMembersHint {
    return Intl.message(
      'Select team members',
      name: 'selectTeamMembersHint',
      desc: '',
      args: [],
    );
  }

  /// `Client Contact`
  String get clientContactLabel {
    return Intl.message(
      'Client Contact',
      name: 'clientContactLabel',
      desc: '',
      args: [],
    );
  }

  /// `(Required)`
  String get requiredLabel {
    return Intl.message(
      '(Required)',
      name: 'requiredLabel',
      desc: '',
      args: [],
    );
  }

  /// `Prepare a PDF document that includes screenshots of chats between you and the client, samples of the work completed, and proof of payment or invoices. Once you've compiled everything into a single PDF, upload it to Google Drive, copy the link, and paste it in here. Make sure the link is set to Anyone with the link can view so that admin can access it.`
  String get proofOfWorkInstructions {
    return Intl.message(
      'Prepare a PDF document that includes screenshots of chats between you and the client, samples of the work completed, and proof of payment or invoices. Once you\'ve compiled everything into a single PDF, upload it to Google Drive, copy the link, and paste it in here. Make sure the link is set to Anyone with the link can view so that admin can access it.',
      name: 'proofOfWorkInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submitButton {
    return Intl.message('Submit', name: 'submitButton', desc: '', args: []);
  }

  /// `Notifications`
  String get notificationsTitle {
    return Intl.message(
      'Notifications',
      name: 'notificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `There are no notifications`
  String get noNotificationsMessage {
    return Intl.message(
      'There are no notifications',
      name: 'noNotificationsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get errorDefaultMessage {
    return Intl.message(
      'Error',
      name: 'errorDefaultMessage',
      desc: '',
      args: [],
    );
  }

  /// `© 2025 ITI Freelancing Hub. All rights reserved..`
  String get footerCopyright {
    return Intl.message(
      '© 2025 ITI Freelancing Hub. All rights reserved..',
      name: 'footerCopyright',
      desc: '',
      args: [],
    );
  }

  /// `Ensure to put the amount in USD currency.`
  String get clientProfileHint {
    return Intl.message(
      'Ensure to put the amount in USD currency.',
      name: 'clientProfileHint',
      desc: '',
      args: [],
    );
  }

  /// `Your Profile on The Platform`
  String get yourProfileLabel {
    return Intl.message(
      'Your Profile on The Platform',
      name: 'yourProfileLabel',
      desc: '',
      args: [],
    );
  }

  /// `Provide the link to your profile on the chosen platform.`
  String get yourProfileHint {
    return Intl.message(
      'Provide the link to your profile on the chosen platform.',
      name: 'yourProfileHint',
      desc: '',
      args: [],
    );
  }

  /// `Select country`
  String get selectCountryHint {
    return Intl.message(
      'Select country',
      name: 'selectCountryHint',
      desc: '',
      args: [],
    );
  }

  /// `Tracks:`
  String get tracksLabel {
    return Intl.message('Tracks:', name: 'tracksLabel', desc: '', args: []);
  }

  /// `Completed and Approved Jobs:`
  String get completedApprovedJobsLabel {
    return Intl.message(
      'Completed and Approved Jobs:',
      name: 'completedApprovedJobsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Total Profit Earned (US):`
  String get totalProfitUSLabel {
    return Intl.message(
      'Total Profit Earned (US):',
      name: 'totalProfitUSLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the verification code sent to your email.`
  String get verifyCody_codeError {
    return Intl.message(
      'Please enter the verification code sent to your email.',
      name: 'verifyCody_codeError',
      desc: '',
      args: [],
    );
  }

  /// `Freelance projects `
  String get myJobs {
    return Intl.message(
      'Freelance projects ',
      name: 'myJobs',
      desc: '',
      args: [],
    );
  }

  /// `Certificates`
  String get myCertificates {
    return Intl.message(
      'Certificates',
      name: 'myCertificates',
      desc: '',
      args: [],
    );
  }

  /// `Dark `
  String get DarkMode {
    return Intl.message('Dark ', name: 'DarkMode', desc: '', args: []);
  }

  /// `Light`
  String get LightMode {
    return Intl.message('Light', name: 'LightMode', desc: '', args: []);
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
