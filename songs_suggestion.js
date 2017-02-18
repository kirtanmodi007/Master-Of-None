const RapidAPI = require('rapidapi-connect');
const rapid = new RapidAPI("EmotionPickerHarmony", "9b5c5601-94fc-46d5-bb7d-3e8eac47a430");
rapid.call('MicrosoftEmotionAPI', 'getEmotionRecognition', {
  // Your Microsfot EmotionAPI substription key (See Docs: https://rapidapi.com/package/MicrosoftEmotionAPI/docs)
  'subscriptionKey': 'd5b98ec4fccd45e096118d0d35f50766',
  // This is the URL of the facial image to be interpreted
  'image': 'http://chuck69.com/glennbeck.jpg'
}).on('success', (payload) => {
  // The MicrosoftEmotionAPI returns a confidence score for happiness, sadness, surprise, anger, fear, contempt, disgust or neutral.
  // The emotion detected should be interpreted as the emotion with the highest score, as scores are normalized to sum to one.
  // I built a simple loop to find the emotion detected.
  let scores = payload[0].scores;
  let strongestEmotion = "";
  let emotionScore = 0;
  for (var key in scores) {
    if (scores[key] > emotionScore) {
      emotionScore = scores[key];
      strongestEmotion = key;
    }
  }
  rapid.call('SpotifyPublicAPI', 'searchPlaylists', {
  // strongestEmotion should now equal the emotion detected in the photo
  'query': 'strongestEmotion',
  'market': '',
  // I limit the results to 1 for simplicity. For this test, I'm just returning the top result
  'limit': '',
  'offset': ''
  }).on('success', (payload) => {
     // A JSON object is returned containing information about the playlist including the name, URL, and owner.
     // Here I have grabbed the playlist's URL and opened it in the browser using the npm package "open"
     open(payload.playlists.items[0].external_urls.spotify);
  }).on('error', (payload) => {
     console.log("Spotify Playlist Query Error");
  });
}).on('error', (payload) => {
  console.log("Microsoft Emotion Error");
});