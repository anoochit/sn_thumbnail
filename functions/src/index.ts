import { onRequest } from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";
import { onCall, HttpsError } from "firebase-functions/v2/https";
import { GoogleGenAI } from "@google/genai";

/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

 
// Start writing functions
// https://firebase.google.com/docs/functions/typescript

export const helloWorld = onRequest((request, response) => {
  logger.info("Hello logs!", { structuredData: true });
  response.send("Hello from Firebase!");
});


export const geminiImageGen = onCall(async (request) => {
  // Message content passed from the client.
  const content = request.data.text;
  // Authentication / user information is automatically added to the request.
  // const uid  = request.auth?.uid;

  // const GEMINI_API_KEY = process.env.GEMINI_API_KEY;
  const GEMINI_API_KEY = "AIzaSyCv9ZYJ4s4N5ym1yuLUWMuZdKIgy-GEhEQ";
  const ai = new GoogleGenAI({ apiKey: GEMINI_API_KEY });
  const result = await ai.models.generateContent({
    model: "gemini-2.0-flash-exp-image-generation",
    contents: content,
    config: {
      responseModalities: ["Text", "Image"],
    },
  });

  logger.info("your prompt: ", content);
  return { resutl: result };
});
