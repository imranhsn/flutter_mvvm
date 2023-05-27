import 'package:flutter/material.dart';

import '../../data/remote/response/ApiResponse.dart';
import '../../models/notification/NotificationMain.dart';
import '../../repository/notification/NotificationRepoImpl.dart';

class NotificationViewModel extends ChangeNotifier {
  final _myRepo = NotificationRepoImp();

  ApiResponse<NotificationMain> notificationMain = ApiResponse.loading();

  void _setMovieMain(ApiResponse<NotificationMain> response) {
    notificationMain = response;
    notifyListeners();
  }

  Future<void> fetchNotifications(BuildContext context) async {
    _setMovieMain(ApiResponse.loading());
    _myRepo
        .getNotificationList(context)
        .then((value) => _setMovieMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setMovieMain(ApiResponse.error(error.toString())));
  }
}
