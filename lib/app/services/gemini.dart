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
  // TODO : call cloud functions
  Future<GenerateContentResponse> generate(
      {required String prompt, required PromptType type}) async {
    String generatePrompt = prompt;
    final model = GenerativeModel(
      model: 'gemini-2.0-flash',
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
