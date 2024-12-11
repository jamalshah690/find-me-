import 'export_repo.dart';

class JobHttpApiRepo implements JobRepository {
  final NetworkApiService _service = NetworkApiService();
  @override
  Future<void> addJob(jobModel) async {
    await _service.postApi(url: '/add', isHeaderRequired: true);
  }

  @override
  Future<void> deleteJob(jobModel) async {
    await _service.postApi(url: '/delete', isHeaderRequired: true);
  }

  @override
  Future<List<JobModel>> fetchJobList() async {
    var res = await _service.getApi(url: '/fetch', isHeaderRequired: true);
    return res;
  }

  @override
  Future<void> updateJob(index, updatedJob) async {
    await _service.postApi(url: '/update', isHeaderRequired: true);
  }
}
