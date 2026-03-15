class UserInfo {
  String browserInfo;
  Map<String, dynamic> ipInfo;
  final DateTime dateTime;

  UserInfo({
    required this.browserInfo,
    required this.ipInfo,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      "browserInfo": browserInfo,
      "ipInfo": ipInfo,
      "dateTime": dateTime.toIso8601String(),
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      browserInfo: map["browserInfo"] ?? "",
      ipInfo: Map<String, dynamic>.from(map["ipInfo"] ?? {}),
      dateTime: DateTime.parse(map["dateTime"]),
    );
  }
}
