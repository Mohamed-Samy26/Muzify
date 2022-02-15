import 'package:youtube_api/youtube_api.dart';
import 'package:http/http.dart' as http;
class Downloader {
  static final String key = "AIzaSyClU3cKBay2hcNzNt6Ls4URh-a4Lh_nqPM";
  static final String localAPIAddress = "http://127.0.0.1:5000/?url=";
  static YoutubeAPI youtube = YoutubeAPI(key ,maxResults: 1);
  static List<YouTubeVideo> videoResult = [];

  static Future<List<YouTubeVideo>> callAPI(String target) async {
    String query = target;
    videoResult = await youtube.search(
      query,
      order: 'viewCount',
      videoDuration: 'any',
      type: 'video',
    );
    return videoResult;
   }
  static void download(String url)async{
     await http.get(Uri.parse(localAPIAddress + url));
  }
}