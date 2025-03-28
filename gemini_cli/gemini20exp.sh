#!/bin/bash
set -e -E

GEMINI_API_KEY="$GEMINI_API_KEY"
MODEL_ID="gemini-2.0-flash-exp-image-generation"
GENERATE_CONTENT_API="streamGenerateContent"

cat << EOF > request.json
{
    "contents": [
      {
        "role": "user",
        "parts": [
          {
            "text": "Hi, can you create a 3d rendered image of a pig  with wings and a top hat flying over a happy futuristic scifi city with lots of greenery?"
          }
        ]
      },
    ],
    "generationConfig": {
      "responseModalities": ["image","text"],
      "responseMimeType": "text/plain"
    }
}
EOF

curl \
-X POST \
-H "Content-Type: application/json" \
"https://generativelanguage.googleapis.com/v1beta/models/${MODEL_ID}:${GENERATE_CONTENT_API}?key=${GEMINI_API_KEY}" -d '@request.json'

