import 'view_export.dart';
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      body: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (c) {
            return ScalesTransitionAnimation(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(90.sp),
                  child: SvgPicture.asset(AppIcons.appIcon),
                ),
              ),
            );
          }),
    );
  }
}
