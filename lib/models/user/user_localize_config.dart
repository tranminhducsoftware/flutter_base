
import 'package:flutter_base/models/localization/language_info.dart';
import 'package:flutter_base/models/localization/localize_source.dart';
import 'package:flutter_base/models/user/user_current_culture_config.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_localize_config.g.dart';

@JsonSerializable()
class UserLocalizationConfig {
  UserCurrentCultureConfig? currentCulture;
  List<LanguageInfo>? languages;
  LanguageInfo? currentLanguage;
  List<LocalizationSource>? sources;
  Map<String, Map<String, String>>? values;
  UserLocalizationConfig(
      {this.currentCulture,
      this.currentLanguage,
      this.languages,
      this.sources,
      this.values});
  factory UserLocalizationConfig.fromJson(Map<String, dynamic> json) =>
      _$UserLocalizationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UserLocalizationConfigToJson(this);
}
