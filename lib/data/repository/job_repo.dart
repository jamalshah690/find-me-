import 'export_repo.dart';

abstract class JobRepository { 
 
 
  Future<List<JobModel>>  fetchJobList( );
   Future<void> updateJob(int index,dynamic data);
     Future<void> deleteJob(JobModel jobModel);
       Future<void> addJob(JobModel jobModel);
}