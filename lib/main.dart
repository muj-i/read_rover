import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:read_rover/application/app.dart';


void main() async {
  await GetStorage.init();
  runApp(const ReadRoverApp());
}


