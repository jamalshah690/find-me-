import 'export_repo.dart';


class JobMockDataRepo implements JobRepository {
  late Box<JobModel> jobBox;

  JobMockDataRepo() {
    jobBox = Hive.box<JobModel>('jobs');
  }

//add data
  @override
  Future<void> addJob(jobModel) async {
    await jobBox.add(jobModel);
  }

// delete data
  @override
  Future<void> deleteJob(jobModel) async {
    int key = jobBox.keys.firstWhere((k) => jobBox.get(k) == jobModel);
    await jobBox.delete(key);
  }

//fetch data
  @override
  Future<List<JobModel>> fetchJobList() async {
    return jobBox.values.toList();
  }

//update data
  @override
  Future<void> updateJob(index, data) async {
    await jobBox.putAt(index, data);
  }
}
