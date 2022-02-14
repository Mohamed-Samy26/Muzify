import 'package:youtube_api/youtube_api.dart';

class Downloader {
  static String key = "AIzaSyClU3cKBay2hcNzNt6Ls4URh-a4Lh_nqPM";

  static YoutubeAPI youtube = YoutubeAPI(key ,maxResults: 1);
  static List<YouTubeVideo> videoResult = [];

  static Future<List<YouTubeVideo>> callAPI(String target) async {
    String query = target;
    videoResult = await youtube.search(
      query,
      order: 'viewCount',
      videoDuration: 'any',
      // regionCode: 'EG',
      type: 'video',
    );
    //videoResult = await youtube.nextPage();
    return videoResult;
   }

}