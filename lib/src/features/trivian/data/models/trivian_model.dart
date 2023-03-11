import '../../domain/domain.dart' show Trivian;

class TrivianModel implements Trivian {
  TrivianModel(
      {required this.found,
      required this.number,
      required this.text,
      required this.type});

  @override
  final bool found;

  @override
  final int number;

  @override
  final String text;

  @override
  final String type;

  @override
  List<Object?> get props => [found, number, text, type];

  @override
  bool? get stringify => true;

  factory TrivianModel.fromJson(Map<String, dynamic> json) => TrivianModel(
        text: json["text"],
        number: json["number"],
        found: json["found"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "number": number,
        "found": found,
        "type": type,
      };
}
