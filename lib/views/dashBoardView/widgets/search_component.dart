// ignore_for_file: must_be_immutable

import '../view_export.dart';

class SearchComponent extends StatelessWidget {
  SearchComponent({super.key});
  final jobController = Get.find<JobController>();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w)
          .copyWith(bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: const Color(0xffE2E4EA)),
        boxShadow: const [
          BoxShadow(
            color: AppColor.KBody,
            blurRadius: 70,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          jobController.isSearchOn.value = true;
          jobController.searchQuery.value = value;
        },
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: const CustomShakeAnimation(
              begin: '-5.0',
              end: '5.0',
              child: Icon(Icons.search, color: AppColor.KBlacks)),
          hintText: 'Search',
          suffixIcon: CustomShakeAnimation(
            begin: '-5.0',
            end: '5.0',
            child: IconButton(
              icon: SvgPicture.asset(AppIcons.closeCircle),
              onPressed: () {
                textEditingController.clear();
                jobController.isSearchOn.value = false;
              },
            ),
          ),
          hintStyle: GoogleFonts.dmSans(
            fontSize: 12.sp,
            color: AppColor.KBlacks,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
        ),
      ),
    );
  }
}
