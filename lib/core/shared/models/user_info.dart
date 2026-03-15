class UserInfo {
  String browserInfo;
  Map<String, dynamic> ipInfo;
  final DateTime dateTime;

  UserInfo({
    required this.browserInfo,
    required this.ipInfo,
    required this.dateTime,
  });

  /// Convert to Firestore map
  Map<String, dynamic> toMap() {
    return {
      "browserInfo": browserInfo,
      "ipInfo": ipInfo,
      "dateTime": dateTime.toIso8601String(),
    };
  }

  /// Create object from Firestore
  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      browserInfo: map["browserInfo"] ?? "",
      ipInfo: Map<String, dynamic>.from(map["ipInfo"] ?? {}),
      dateTime: DateTime.parse(map["dateTime"]),
    );
  }
}
