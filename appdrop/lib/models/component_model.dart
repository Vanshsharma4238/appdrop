class ComponentModel {
  final String type;
  final Map<String, dynamic> data;

  ComponentModel({
    required this.type,
    required this.data,
  });

  factory ComponentModel.fromJson(Map<String, dynamic> json) {
    return ComponentModel(
      type: (json['type'] ?? '').toString(),
      data: json,
    );
  }
}
