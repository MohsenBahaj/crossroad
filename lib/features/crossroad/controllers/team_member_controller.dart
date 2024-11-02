import 'package:crossroad/data/repositories/crossroad/team_member.dart';
import 'package:crossroad/features/crossroad/models/team_member.dart';
import 'package:get/get.dart';

class TeamMemberController extends GetxController {
  final TeamMemberRepository _teamMemberRepository =
      TeamMemberRepository.instance;
  var teamMembers = <TeamMemberModel>[].obs; // Observable list of team members
  var isLoading = true.obs; // Loading state

  @override
  void onInit() {
    fetchAllTeamMembers();
    super.onInit();
  }

  // Fetch all team members
  Future<void> fetchAllTeamMembers() async {
    try {
      isLoading.value = true; // Set loading state to true
      teamMembers.value = await _teamMemberRepository
          .fetchAllTeamMembers(); // Fetch team members from repository
    } catch (e) {
      // Handle errors here, possibly by showing a message to the user
      print(e);
    } finally {
      isLoading.value = false; // Set loading state to false
    }
  }

  // Fetch a team member by ID
  Future<TeamMemberModel?> fetchTeamMemberById(String teamMemberId) async {
    try {
      return await _teamMemberRepository
          .fetchTeamMemberRecord(teamMemberId); // Fetch a team member by ID
    } catch (e) {
      print(e);
      return null; // Return null in case of error
    }
  }
}
