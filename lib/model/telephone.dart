class Telephone {
  final int id;
  final String name;
  final String number;
  final int personId;

  const Telephone({
    required this.id,
    required this.name,
    required this.number,
    required this.personId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'personId': personId,
    };
  }

  factory Telephone.fromMap(Map<String, dynamic> map) {
    return Telephone(
      id: map['id_telephone'] as int,
      name: map['telephone_name'] as String,
      number: map['telephone_number'] as String,
      personId: map['person_id'] as int,
    );
  }
}