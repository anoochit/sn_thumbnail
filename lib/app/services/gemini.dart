import 'dart:developer';

import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  // api key
  String _apiKey = '';

  // constructor
  GeminiService({required String apiKey}) {
    _apiKey = apiKey;
  }

  // generate
  Future<GenerateContentResponse> generate(
      {required String prompt, required PromptType type}) async {
    String generatePrompt = prompt;
    // model: 'gemini-2.0-flash-exp',
    final model = GenerativeModel(
      model: 'gemini-1.5-pro-latest',
      apiKey: _apiKey,
    );

    if (type == PromptType.title) {
      generatePrompt =
          'You are Content Marketer. Create a 5 SEO title, slug and 10 hash tags (separate each word by space) from this content "$prompt". Show as JSON using this format [{"title" : "TITLE", "slug", : "SLUG", "tags" : "#TAG"}]';
    }

    log('generatePrompt: $generatePrompt');

    return await model.generateContent([Content.text(generatePrompt)]);
  }
}

enum PromptType {
  title,
  image,
}
