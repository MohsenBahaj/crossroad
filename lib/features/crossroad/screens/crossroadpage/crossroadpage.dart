import 'package:crossroad/common/widgets/appbar/appbar.dart';
import 'package:crossroad/common/widgets/texts/head_section.dart';
import 'package:crossroad/features/crossroad/controllers/mentor_controller.dart';
import 'package:crossroad/features/crossroad/controllers/team_member_controller.dart';
import 'package:crossroad/features/crossroad/models/team_member.dart';
import 'package:crossroad/features/crossroad/screens/crossroadpage/widgets/mentorcard.dart';
import 'package:crossroad/features/crossroad/screens/crossroadpage/widgets/teamcard.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CrossRoadsScreen extends StatelessWidget {
  const CrossRoadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<MentorController>();
    var memberController = Get.find<TeamMemberController>();

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text('CrossRoad'),
          showBackArrow: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(), // Enable bounce effect
            slivers: [
              // Section Heading for Mentors
              SliverToBoxAdapter(
                child: AppSectionHeading(
                  title: 'Our Mentors',
                  showActionButton: false,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: AppSizes.spaceBtwSections),
              ),

              // Mentor List
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return MentorCard(
                      name: controller.mentors[index].name,
                      bio: controller.mentors[index].bio,
                      desc: controller.mentors[index].description,
                      linkedinUrl: controller.mentors[index].linkedinUrl,
                      imageUrl: controller.mentors[index].imageUrl,
                    );
                  },
                  childCount: controller.mentors
                      .length, // Dynamic child count based on mentor list length
                ),
              ),

              // Section Heading for Team Members
              SliverToBoxAdapter(
                child: SizedBox(height: AppSizes.spaceBtwSections),
              ),
              SliverToBoxAdapter(
                child: AppSectionHeading(
                  title: 'Our Team',
                  showActionButton: false,
                ),
              ),

              // Team Members List
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return TeamCard(
                      member: TeamMemberModel(
                        id: memberController.teamMembers[index].id,
                        name: memberController.teamMembers[index].name,
                        bio: memberController.teamMembers[index].bio,
                        photo: memberController.teamMembers[index].photo,
                        linkedinUrl:
                            memberController.teamMembers[index].linkedinUrl,
                      ),
                    );
                  },
                  childCount: memberController.teamMembers
                      .length, // Dynamic child count based on team member list length
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
