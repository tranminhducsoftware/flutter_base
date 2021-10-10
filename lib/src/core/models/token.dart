import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String refreshToken;
  final String accessToken;

  const Token({ required this.refreshToken, required this.accessToken});

  @override
  List<Object> get props => [refreshToken, accessToken];

  static Token fromJson(dynamic json) {
    return Token(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'refreshToken': refreshToken
  };

}