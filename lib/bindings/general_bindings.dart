import 'package:crossroad/data/repositories/crossroad/mentor_repo.dart';
import 'package:crossroad/data/repositories/episode/episoderepo.dart';
import 'package:crossroad/data/repositories/user/user_repositry.dart';
import 'package:crossroad/data/services/network_manager.dart';
import 'package:crossroad/features/crossroad/controllers/home_controller.dart';
import 'package:crossroad/features/crossroad/controllers/mentor_controller.dart';
import 'package:crossroad/features/crossroad/controllers/team_member_controller.dart';
import 'package:crossroad/features/personalization/controllers/user_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(HomeController());
    // Get.put(MentorRepository());
    Get.put(EpisodeRepository());
    Get.put(TeamMemberController());
    Get.put(MentorController());
    Get.put(UserController());
  }
}
