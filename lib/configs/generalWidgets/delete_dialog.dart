
import 'export_general.dart';

class DeleteJobDialog extends StatelessWidget {
  final JobModel jobModel;
  DeleteJobDialog({Key? key, required this.jobModel}) : super(key: key);
  final jobController = Get.find<JobController>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextComponents(
        title: 'Delete Job?',
        size: 22.sp,
        weight: FontWeight.w600,
        color: AppColor.KBlacks,
      ),
      content: TextComponents(
        title: 'Are you sure you want to delete this job?',
        size: 12.sp,
        weight: FontWeight.w300,
        color: AppColor.KBlacks,
      ),
      actions: [
        Obx(() => PrimaryButton(
              width: 20.w,
              height: 48.h,
                
              onTap: () async {
                await jobController.deleteJob(jobModel);
              },
              childWidget: jobController.isLoading.value
                  ? Center(
                      child: getCircle(AppColor.kWhiteColor,
                          const Color.fromARGB(255, 92, 88, 88)),
                    )
                  : TextComponents(
                      title: 'Delete',
                      size: 12.sp,
                      weight: FontWeight.w600,
                      color: AppColor.kWhiteColor,
                    ),
              bgColor: AppColor.KBlacks,
            )),
        6.heightSpace,
        PrimaryButton(
          width: 20.w,
          height: 48.h,
          // Close the dialog
          onTap: () {
            Get.back();
          },
          childWidget: TextComponents(
            title: 'Cancel',
            size: 12.sp,
            weight: FontWeight.w600,
            color: AppColor.kWhiteColor,
          ),
          bgColor: AppColor.KBlacks,
        ),
      ],
    );
  }
}
