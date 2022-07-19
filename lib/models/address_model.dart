class AddressModel {
  String id;
  String userId;
  String contactPerson;
  String phone;
  String address;
  String landmark;

  AddressModel({
    this.id = '',
    required this.userId,
    required this.contactPerson,
    required this.phone,
    required this.address,
    this.landmark = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'contact_person': contactPerson,
        'phone': phone,
        'address': address,
        'landmark': landmark,
      };

  static AddressModel fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'],
        userId: json['user_id'],
        contactPerson: json['contact_person'],
        phone: json['phone'],
        address: json['address'],
        landmark: json['landmark'],
      );
}
