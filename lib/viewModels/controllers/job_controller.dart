import 'package:findme/data/repository/job_repo.dart';
import 'package:findme/data/response/status.dart';
import 'package:findme/models/job_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class JobController extends GetxController {
  JobRepository jobRepository;
  JobController({required this.jobRepository});
  var jobList = <JobModel>[].obs;
  RxBool isLoading = false.obs;
  var searchQuery = ''.obs;
  RxBool isSearchOn = false.obs;

  Rx<Status> jobStatus = Status.LOADING.obs;
  void setJobStaus(Status _value) => jobStatus.value = _value;

  @override
  void onReady() {
    super.onReady();
    loadJobs();
  }

  void loadJobs() async {
    try {
      setJobStaus(Status.LOADING);
      var jobs = await jobRepository.fetchJobList();

      // here i apply sort method i store datetime then i convert that datetime into force 24 hour time

      jobs.sort((a, b) {
        var timeA = DateFormat.Hm().format(a.dateTime);
        var timeB = DateFormat.Hm().format(b.dateTime);
        print('timeA : ${timeA}'); //15:23
        print('timeB : ${timeB}'); //15:27
        return timeB.compareTo(timeA);
      });

      jobList.value = jobs;
      setJobStaus(Status.COMPLETED);
    } catch (e) {
      setJobStaus(Status.ERROR);
      print(e.toString());
    }
  }

  // Add a new job
  Future<void> addJob(JobModel job) async {
    try {
      isLoading.value = true;
      await jobRepository.addJob(job);
      isLoading.value = false;
      Get.back();
      // Refresh the list after adding
      loadJobs();
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  // Update an existing job
  Future<void> updateJob(int index, JobModel updatedJob) async {
    try {
      isLoading.value = true;
      await jobRepository.updateJob(index, updatedJob);
      isLoading.value = false;
      Get.back();
      // Refresh the list after updating
      loadJobs();
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  // Delete a job
  Future<void> deleteJob(JobModel jobModel) async {
    try {
      isLoading.value = true;
      await jobRepository.deleteJob(jobModel);

      isLoading.value = false;
      Get.back();
// Refresh the list after deleting
      loadJobs();
    } catch (e) {
      print(e.toString());
    }
  }

  // Filtered list based on search query i used here getter
  List<JobModel> get filteredJobs => jobList
      .where((job) =>
          job.title.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          job.description
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
      .toList();
}
