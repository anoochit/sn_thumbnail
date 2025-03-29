import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

void main() async {
  final apiKey = Platform.environment['GEMINI_API_KEY'];
  if (apiKey == null) {
    stderr.writeln(r'No $GEMINI_API_KEY environment variable');
    exit(1);
  }

  final model = GenerativeModel(
    model: 'gemini-2.0-flash-exp-image-generation',
    apiKey: apiKey,
    generationConfig: GenerationConfig(
      temperature: 1,
      topK: 40,
      topP: 0.95,
      responseMimeType: "text/plain",
    ),
  );

  final chat = model.startChat();
  final message = 'create image of cat ';
  final content = Content.text(message);

  GenerateContentResponse response = await chat.sendMessage(content);
  print(response.text);
}
