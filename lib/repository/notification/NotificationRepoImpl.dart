import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';
import '../../models/notification/NotificationMain.dart';
import 'NotificationRepo.dart';

class NotificationRepoImp implements NotificationRepo {
  BaseApiService _apiService = NetworkApiService() as BaseApiService;

  @override
  Future<NotificationMain?> getNotificationList(BuildContext context) async {
    try {
      // return data from asset folder, if you have api please call using _apiService
      String data = await DefaultAssetBundle.of(context)
          .loadString("assets/json/notification.json");
      final jsonData = jsonDecode(data);
      return NotificationMain.fromJson(jsonData);
    } catch (e) {
      throw e;
    }
  }
}
