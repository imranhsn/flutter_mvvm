import 'package:intl/intl.dart';

class Utils {
  static String getHeaderText(String time) {
    final dateTimeNow = DateTime.now();
    final currentDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(time);

    final currentDays = dateTimeNow.difference(currentDate).inDays;

    if (currentDays < 1) {
      return "Today";
    } else if (currentDays < 7) {
      return "This Week";
    } else if (currentDays < 30) {
      return "This Month";
    } else {
      return "Earlier";
    }
  }

  static String getTimePassed(String time) {
    final numericDates = true;
    final dateTimeNow = DateTime.now();
    final currentDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(time);
    final newFormatter = DateFormat("dd MMMM, yyyy");

    final difference = dateTimeNow.difference(currentDate);

    if (difference.inSeconds < 5) {
      return 'Just now';
    } else if (difference.inSeconds <= 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes <= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inMinutes <= 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours <= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inHours <= 60) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays <= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inDays <= 6) {
      return '${difference.inDays} days ago';
    }
    return newFormatter.format(currentDate);
  }
}
