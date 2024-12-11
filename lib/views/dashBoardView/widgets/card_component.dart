
import 'dart:developer';

import '../view_export.dart';
class CardComponent extends StatelessWidget {
  CardComponent({super.key});
  final jobController = Get.find<JobController>();

  @override
  Widget build(BuildContext context) {
    log('search off');
    return Obx(() {
      // Observe jobList and build a ListView
      if (jobController.jobList.isEmpty) {
        return Padding(
          padding: const EdgeInsets.all(8.0).copyWith(top: 300.h),
          child: Center(
              child: TextComponents(
            title: 'No jobs available.',
            size: 16.sp,
            weight: FontWeight.w600,
            color: AppColor.KBlacks,
          )),
        );
      }
      return AnimationLimiter(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: jobController.jobList.length,
          itemBuilder: (context, index) {
            JobModel job = jobController.jobList[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 400),
              child: SlideAnimation(
                verticalOffset: 44.0,
                child: FadeInAnimation(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                    padding: EdgeInsets.all(16.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 34.0,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextComponents(
                          title: job.title,
                          size: 16.sp,
                          weight: FontWeight.w600,
                          color: AppColor.KBlacks,
                        ),
                        2.heightSpace,
                        TextComponents(
                          title: job.description,
                          size: 12.sp,
                          weight: FontWeight.w300,
                          color: AppColor.KBlacks,
                        ),
                        4.heightSpace,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Status : ',
                                style: GoogleFonts.dmSans(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: job.status,
                                    style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.bold,
                                      color: job.status == 'Pending'
                                          ? AppColor.kYellow
                                          : job.status == 'In-progress'
                                              ? AppColor.kBlue150Color
                                              : AppColor.kGreen1Color,
                                      fontSize: 16.0.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomShakeAnimation(
                                  begin: '-5.0',
                                  end: '5.0',
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.dialog(DeleteJobDialog(
                                        jobModel: job,
                                      ));
                                    },
                                    child: SvgPicture.asset(
                                      AppIcons.deleteIcon,
                                      width: 25.w,
                                      height: 25.h,
                                    ),
                                  ),
                                ),
                                16.widthSpace,
                                CustomShakeAnimation(
                                  begin: '5.0',
                                  end: '0.0',
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => EditView(
                                            jobModels: job,
                                            index: index,
                                          ));
                                    },
                                    child: SvgPicture.asset(
                                      AppIcons.editIcon,
                                      width: 25.w,
                                      height: 25.h,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
