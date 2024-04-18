import 'source.dart';

class SourceResponse {
  final String? status;
  final String? code;
  final String? message;
  final List<Source>? sources;

  const SourceResponse({this.status, this.code, this.message, this.sources});

  factory SourceResponse.fromJson(Map<String, dynamic> data) => SourceResponse(
        status: data['status'] as String?,
        code: data['code'] as String?,
        message: data['message'] as String?,
        sources: (data['sources'] as List<dynamic>?)
            ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
