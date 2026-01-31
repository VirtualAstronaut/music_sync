import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as yt_exp;

part 'video_info.freezed.dart';

@freezed
abstract class VideoInfo with _$VideoInfo {
  const factory VideoInfo({
    required String title,
    required String author,
    required String duration,
    required String url,
    required String thumbnail,
    required String audioUrl,
    required String videoId,
  }) = _VideoInfo;

  factory VideoInfo.fromYoutube(yt_exp.Video video) {
    String formatDuration(Duration? d) {
      if (d == null) return 'Unknown';
      final h = d.inHours;
      final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
      final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
      return h > 0 ? '$h:$m:$s' : '$m:$s';
    }

    return VideoInfo(
      title: video.title,
      author: video.author,
      duration: formatDuration(video.duration),
      url: video.url,
      thumbnail: video.thumbnails.highResUrl,
      audioUrl: '', // To be filled by local API later
      videoId: video.id.value,
    );
  }

  factory VideoInfo.fromJson(Map<String, dynamic> json) {
    // Extract audio URL from requested_formats
    String audioUrl = '';
    if (json['requested_formats'] != null && json['requested_formats'] is List) {
      final formats = json['requested_formats'] as List;
      for (final format in formats) {
        if (format is Map<String, dynamic>) {
          // Rule: search for key for 'resolution'
          // User said "it should contain video" and "This url is audio"
          // We'll search for 'url' in the list. To be safe, we look for formats
          // that are typically audio streams (where resolution is null/empty).
          final resolution = format['resolution']?.toString().toLowerCase() ?? '';

          // If the user specifically meant the one labeled 'video' but used for audio, we'd check for 'video'
          // but usually audio streams have no resolution.
          if (resolution == 'null' ||
              resolution.isEmpty ||
              resolution.contains('audio')) {
            audioUrl = format['url']?.toString() ?? '';
            if (audioUrl.isNotEmpty) break;
          }
        }
      }

      // Fallback: If still empty, just take the first one that has a URL
      if (audioUrl.isEmpty && formats.isNotEmpty) {
        audioUrl = (formats.first as Map<String, dynamic>)['url']?.toString() ?? '';
      }
    }

    return VideoInfo(
      title: json['title'] ?? '',
      author: json['author'] ?? json['uploader'] ?? '',
      duration: json['duration']?.toString() ?? '',
      url: json['webpage_url'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      audioUrl: audioUrl,
      videoId: json['id'] ?? '',
    );
  }
}
