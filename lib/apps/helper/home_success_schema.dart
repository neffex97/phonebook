class HomeSuccessSchema {
  HomeSuccessSchema({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? notes,
    String? phone,
    List? picture,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _notes = notes;
    _phone = phone;
    _picture = picture;
  }

  HomeSuccessSchema.fromJson(dynamic json) {
    _id = json['_id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _notes = json['notes'];
    _phone = json['phone'];
    _picture = json['picture'];
  }
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _notes;
  String? _phone;
  List? _picture;
  HomeSuccessSchema copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? notes,
    String? phone,
    List? picture,
  }) =>
      HomeSuccessSchema(
        id: id ?? _id,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        notes: notes ?? _notes,
        phone: phone ?? _phone,
        picture: picture ?? _picture,
      );
  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get notes => _notes;
  String? get phone => _phone;
  List? get picture => _picture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['notes'] = _notes;
    map['phone'] = _phone;
    map['picture'] = _picture;
    return map;
  }
}
