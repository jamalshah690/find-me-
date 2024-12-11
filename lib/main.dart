import 'package:findme/data/repository/job_mock_data_repo.dart';
import 'package:findme/data/repository/job_repo.dart';
import 'package:findme/models/job_model.dart';
import 'package:findme/viewModels/controllers/job_controller.dart';
import 'package:findme/views/splashView/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

GetIt getIt = GetIt.instance;

void setup() {

  // for local data
  getIt.registerLazySingleton<JobRepository>(() => JobMockDataRepo());

  //for api request
//getIt.registerLazySingleton<JobRepository>(() => JobHttpApiRepo());
 
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //call dependancy injection method
  setup();

 
 // initialize hive 
  await Hive.initFlutter();
   Hive.registerAdapter(JobModelAdapter());
  await Hive.openBox<JobModel>('jobs');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    Get.put(JobController(jobRepository: getIt<JobRepository>()),
        permanent: true);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              color: Colors.white,
            ),
          ),
          debugShowCheckedModeBanner: false,
          title: 'remote karu ',
          home: const SplashView(),
        );
      },
    );
  }
}
 