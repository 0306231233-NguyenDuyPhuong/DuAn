import 'package:coffee_shop_test/data/models/feedback.dart';
import 'package:coffee_shop_test/data/services/feedback_service.dart';

class FeedbackViewmodels {
  final FeedbackService _feedbackService = FeedbackService();

  Future<Map<String, dynamic>> getFeedback(String token, int product_id) async {
    final data = await _feedbackService.getFeedBacks(token, product_id);
    return {
      "feedbacks": data
    };
  }

  Future<Map<String, dynamic>> postFeedback(String token, FeedbackModel feedback) async {
    final data = await _feedbackService.postFeedBack(token, feedback);
    return {
      "feedbacks": data
    };
  }
}