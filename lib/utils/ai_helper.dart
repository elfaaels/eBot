import 'package:ebot/shared/api_config.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AIHelper {
  final GenerativeModel model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: ApiConfig().apiKey,
  );

  String generateByText({TextEditingController? controller}) {
    String answer = '';
    model.generateContent([Content.text(controller!.text)]).then((value) {
      answer = value.text.toString();
    });
    return answer;
  }
}
