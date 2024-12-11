import 'view_export.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final jobController = Get.find<JobController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColor.kWhiteColor,
        backgroundColor: AppColor.kWhiteColor,
        foregroundColor: AppColor.kWhiteColor,
        elevation: 0,
        centerTitle: true,
        title: TextComponents(
          title: 'Home View',
          size: 16.sp,
          weight: FontWeight.w600,
          color: AppColor.KBlacks,
        ),
      ),
      backgroundColor: AppColor.kWhiteColor,
      floatingActionButton: CustomShakeAnimation(
        begin: '-5.0',
        end: '5.0',
        child: FloatingActionButton(
          backgroundColor: AppColor.KBlacks,
          onPressed: () {
            Get.to(() => AddJobView());
          },
          child: const Icon(
            Icons.add,
            color: AppColor.kWhiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SearchComponent(),
            Obx(
              () => jobController.isSearchOn.value
                  ? SearchCardComponent()
                  : CardComponent(),
            )
          ],
        ),
      ),
    );
  }
}
