import 'package:flutter/material.dart';
import 'package:group_35_notes_app/controllers/cache_helper.dart';
import 'package:group_35_notes_app/controllers/sql_helper.dart';

import 'root/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  await SqlHelper.init();

  runApp(const AppRoot());
}
