import 'package:crossroad/data/repositories/crossroad/mentor_repo.dart';
import 'package:crossroad/features/crossroad/models/mentors_model.dart';
import 'package:get/get.dart';

class MentorController extends GetxController {
  final MentorRepository _mentorRepository = MentorRepository.instance;
  var mentors = <MentorModel>[].obs; // Observable list of mentors
  var isLoading = true.obs; // Loading state

  @override
  void onInit() {
    fetchAllMentors();
    super.onInit();
  }

  // Fetch all mentors
  Future<void> fetchAllMentors() async {
    try {
      isLoading.value = true; // Set loading state to true
      mentors.value = await _mentorRepository
          .fetchAllMentors(); // Fetch mentors from repository
    } catch (e) {
      // Handle errors here, possibly by showing a message to the user
      print(e);
    } finally {
      isLoading.value = false; // Set loading state to false
    }
  }

  // Fetch a mentor by ID
  Future<MentorModel?> fetchMentorById(String mentorId) async {
    try {
      return await _mentorRepository
          .fetchMentorRecord(mentorId); // Fetch a mentor by ID
    } catch (e) {
      print(e);
      return null; // Return null in case of error
    }
  }
}
