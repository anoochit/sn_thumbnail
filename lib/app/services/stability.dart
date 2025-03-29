import 'dart:typed_data';

import 'package:http/http.dart' as http;

class StabilityService {
  // api host
  static const _stabilityHost = 'https://api.stability.ai';

  // api key
  String _apiKey = '';

  // constructor
  StabilityService({required String apiKey}) {
    _apiKey = apiKey;
  }

  // generate text to image
  // TODO : call cloud functions
  Future<Uint8List> textToImage(
      {required String prompt,
      String ratio = "9:16",
      String format = "png",
      String model = "sd3-medium"}) async {
    // url endpoint
    const url = '$_stabilityHost/v2beta/stable-image/generate/sd3';

    // header
    final headers = {
      "authorization": "Bearer $_apiKey",
      "accept": "image/*",
    };

    // fields
    final fields = {
      "prompt": prompt,
      "output_format": format,
      "aspect_ratio": ratio,
      "model": model
    };

    // build request
    final request = http.MultipartRequest("POST", Uri.parse(url));
    request.headers.addAll(headers);
    fields.forEach((key, value) => request.fields[key] = value);

    // sent request
    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        // get image byte
        final bytes = await response.stream.toBytes();

        // return byte image
        return Uint8List.fromList(bytes);
      } else {
        // throw error
        throw ("${response.reasonPhrase}");
      }
    } catch (error) {
      // throw error
      throw ("$error");
    }
  }
}
