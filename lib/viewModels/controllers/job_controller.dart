import 'package:findme/data/repository/job_repo.dart';
import 'package:findme/models/job_model.dart';
import 'package:get/get.dart';

class JobController extends GetxController {
  JobRepository jobRepository;
  JobController({required this.jobRepository});
  var jobList = <JobModel>[].obs;
  RxBool isLoading = false.obs;
  var searchQuery = ''.obs;
  RxBool isSearchOn = false.obs;
  @override
  void onInit() {
    super.onInit();
    loadJobs();
  }

  // Fetch jobs from the repository
  void loadJobs() async {
    jobList.value = await jobRepository.fetchJobList();
  }

  // Add a new job
  Future<void> addJob(JobModel job) async {
    isLoading.value = true;
    await jobRepository.addJob(job);
    isLoading.value = false;
    Get.back();
    loadJobs(); // Refresh the list after adding
  }

  // Update an existing job
  Future<void> updateJob(int index, JobModel updatedJob) async {
    isLoading.value = true;
    await jobRepository.updateJob(index, updatedJob);
    isLoading.value = false;
    Get.back();
    loadJobs(); // Refresh the list after updating
  }

  // Delete a job
  Future<void> deleteJob(JobModel jobModel) async {
    isLoading.value = true;
    await jobRepository.deleteJob(jobModel);
    isLoading.value = false;
    Get.back();

    loadJobs(); // Refresh the list after deleting
  }

  // Filtered list based on search query
  List<JobModel> get filteredJobs => jobList
      .where((job) =>
          job.title.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          job.description
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
      .toList();
}
