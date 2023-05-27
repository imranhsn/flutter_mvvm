import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/remote/response/Status.dart';
import '../../models/notification/NotificationMain.dart';
import '../../res/style/TextStyles.dart';
import '../../utils/Utils.dart';
import 'NotificationViewModel.dart';
import '../review/ReviewScreen.dart';
import '../widget/ErrorView.dart';
import '../widget/LoadingView.dart';

class NotificationScreen extends StatefulWidget {
  static final String id = "notification_screen";

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final _viewModel = NotificationViewModel();

  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async {
    await _viewModel.fetchNotifications(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotificationViewModel>(
      create: (_) => _viewModel,
      child: Consumer<NotificationViewModel>(
        builder: (context, viewModel, _) {
          final status = viewModel.notificationMain.status;
          final data = viewModel.notificationMain.data;
          final message = viewModel.notificationMain.message ?? "NA";

          if (status == Status.LOADING) {
            return LoadingWidget();
          } else if (status == Status.ERROR) {
            return MyErrorWidget(message);
          } else if (status == Status.COMPLETED) {
            return _buildNotificationListView(data?.notifications);
          }

          return Container();
        },
      ),
    );
  }

  Widget _buildNotificationListView(List<NotificationModel>? notificationList) {
    return ListView.builder(
      itemCount: notificationList?.length,
      itemBuilder: (context, position) {
        final item = notificationList![position];
        final header = Utils.getHeaderText(item.time.toString());
        final preHeader = position > 0
            ? Utils.getHeaderText(
                notificationList[position - 1].time.toString())
            : "";

        return Column(
          children: [
            if (header != preHeader)
              Container(
                alignment: Alignment.topLeft,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  header.toString(),
                  style: TextStyles.header,
                ),
              ),
            _buildNotificationListItem(item),
          ],
        );
      },
    );
  }

  Widget _buildNotificationListItem(NotificationModel item) {
    final users = item.users?.length ?? 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        tileColor: Colors.white,
        leading: users > 1
            ? SizedBox(
                height: 44,
                width: 44,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 34.0,
                        height: 34.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            image: NetworkImage(item.users![0]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all( Radius.circular(16.0)),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 34.0,
                        height: 34.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            image: NetworkImage(item.users![1]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all( Radius.circular(16.0)),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : CircleAvatar(
                backgroundImage: NetworkImage(item.users![0]),
                minRadius: 22,
                maxRadius: 22,
              ),
        title: MarkdownBody(
          data: item.title.toString(),
          onTapLink: (text, url, title) => launch(url.toString()),
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
              .copyWith(p: TextStyles.title),
        ),
        subtitle: Text(
          Utils.getTimePassed(item.time.toString()),
          style: TextStyles.subTitle,
        ),
        trailing: Container(
          height: 50,
          width: 76,
          child: Image.network(
            item.image.toString(),
            fit: BoxFit.fill,
          ),
        ),
        onTap: () {
          _sendDataToReviewScreen(context, item);
        },
      ),
    );
  }

  void _sendDataToReviewScreen(BuildContext context, NotificationModel item) {
    Navigator.pushNamed(context, ReviewScreen.id, arguments: item);
  }
}
