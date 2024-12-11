// ignore_for_file: must_be_immutable

import 'view_export.dart';

class AddJobView extends StatelessWidget {
  AddJobView({super.key});

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  final RxString _selectedStatus = 'Pending'.obs;

  final _formKey = GlobalKey<FormState>();

  final List<String> _statusOptions = ['Completed', 'Pending', 'In-progress'];

  final jobController = Get.find<JobController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kWhiteColor,
        elevation: 0,
        centerTitle: true,
        title: TextComponents(
          title: 'Add Job',
          size: 16.sp,
          weight: FontWeight.w600,
          color: AppColor.KBlacks,
        ),
      ),
      backgroundColor: AppColor.kWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.heightSpace,
                TextComponents(
                  title: 'Title',
                  size: 16.sp,
                  weight: FontWeight.w500,
                  color: AppColor.KBlacks,
                ),
                10.heightSpace,
                CustomFieldComponents(
                  keyboardType: TextInputType.text,
                  controller: titleController,
                  hint: 'Write title here',
                  prefixIconSvg: AppIcons.titleIcon,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'title must not be empty';
                    }
                     
                  },
                  onChanged: (value) {},
                ),
                20.heightSpace,
                TextComponents(
                  title: 'Description',
                  size: 16.sp,
                  weight: FontWeight.w500,
                  color: AppColor.KBlacks,
                ),
                10.heightSpace,
                CustomFieldComponents(
                  keyboardType: TextInputType.text,
                  controller: descriptionController,
                  hint: 'Write Description here',
                  prefixIconSvg: AppIcons.description,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Description must not be empty';
                    }
               
                  },
                  onChanged: (value) {},
                ),
                20.heightSpace,
                TextComponents(
                  title: 'Select Status:',
                  size: 16.sp,
                  weight: FontWeight.w500,
                  color: AppColor.KBlacks,
                ),
                10.heightSpace,
                Obx(() => DropdownButton<String>(
                      value: _selectedStatus.value,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        _selectedStatus.value = newValue!;
                      },
                      items: _statusOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                40.heightSpace,
                Obx(() => PrimaryButton(
                      width: 20.w,
                      height: 48.h,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          JobModel jobModel = JobModel(dateTime: DateTime.now() ,
                              title: titleController.text.trim().toString(),
                              description:
                                  descriptionController.text.trim().toString(),
                              status: _selectedStatus.value.toString());
                          await jobController.addJob(jobModel);
                        }
                      },
                      childWidget: jobController.isLoading.value
                          ? Center(
                              child: getCircle(AppColor.kWhiteColor,
                                  const Color.fromARGB(255, 92, 88, 88)),
                            )
                          : TextComponents(
                              title: 'Save',
                              size: 12.sp,
                              weight: FontWeight.w600,
                              color: AppColor.kWhiteColor,
                            ),
                      bgColor: AppColor.KBlacks,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
