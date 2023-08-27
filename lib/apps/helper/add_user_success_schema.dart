class AddUserSuccessSchema {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? notes;
  List<String>? picture;
  String? phone;

  AddUserSuccessSchema(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.notes,
      this.picture,
      this.phone});

  AddUserSuccessSchema.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    notes = json['notes'];
    picture = json['picture'].cast<String>();
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['notes'] = notes;
    data['picture'] = picture;
    data['phone'] = phone;
    return data;
  }
}
