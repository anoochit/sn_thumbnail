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

    final model = GenerativeModel(
      model: 'gemini-1.5-pro-latest',
      apiKey: _apiKey,
    );

    if (type == PromptType.title) {
      generatePrompt =
          'You are Content Marketer. Create a 5 SEO title and 10 hash tags from this content "$prompt". Show as JSON using this format [{"title" : "TITLE","tags" : "TAG"}]';
    }

    return await model.generateContent([Content.text(generatePrompt)]);
  }
}

enum PromptType {
  title,
  image,
}
