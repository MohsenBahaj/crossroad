import 'package:crossroad/app.dart';
import 'package:crossroad/data/repositories/authentication/authentication_repo.dart';
import 'package:crossroad/data/repositories/crossroad/mentor_repo.dart';
import 'package:crossroad/data/repositories/crossroad/team_member.dart';
import 'package:crossroad/data/repositories/episode/episoderepo.dart';
import 'package:crossroad/data/repositories/user/user_repositry.dart';
import 'package:crossroad/features/crossroad/controllers/mentor_controller.dart';
import 'package:crossroad/features/crossroad/controllers/video_controller.dart';
import 'package:crossroad/firebase_options.dart';
import 'package:crossroad/utils/exceptions/firbase_exception.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // Ensure widget binding
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local storage
  await GetStorage.init();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Authentication Repository first
  Get.put(AuthenticationRepository());
  Get.put(UserRepositry());

  // Initialize other repositories and controllers
  Get.put(EpisodeRepository());
  Get.put(MentorRepository());
  Get.put(
      MentorController()); // Ensure this controller does not access Auth repo prematurely
  Get.put(TeamMemberRepository());
  Get.put(VideoController(), tag: 'global_video_controller');
  // Run the app
  runApp(MyApp());
}
