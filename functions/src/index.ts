// import { onRequest } from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";
import { onCall } from "firebase-functions/v2/https";

/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

/*
Start writing functions
https://firebase.google.com/docs/functions/typescript

export const helloWorld = onRequest((request, response) => {
  logger.info("Hello logs!", { structuredData: true });
  response.send("Hello from Firebase!");
});
*/

export const geminiImageGen = onCall((request, response) => {
  // Message text passed from the client.
  const text = request.data.text;
  // Authentication / user information is automatically added to the request.
  // const uid = request.auth.uid;
  logger.info("your text: ", text);
  return { text: text };
});
