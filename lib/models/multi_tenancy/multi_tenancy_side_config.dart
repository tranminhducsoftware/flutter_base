import 'package:flutter_base/constants/app_enums.dart';
import 'package:json_annotation/json_annotation.dart';
part 'multi_tenancy_side_config.g.dart';

@JsonSerializable()
class MultiTenancySideConfig {
  MultiTenancySides? host;
  MultiTenancySides? tenant;
  MultiTenancySideConfig({this.host, this.tenant});

  factory MultiTenancySideConfig.fromJson(Map<String, dynamic> json) =>
      _$MultiTenancySideConfigFromJson(json);

  Map<String, dynamic> toJson() => _$MultiTenancySideConfigToJson(this);
}
