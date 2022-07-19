class AddressModel {
  String id;
  String userId;
  String contactPerson;
  int phone;
  String addressName;
  String locality;
  String landmark;

  AddressModel({
    this.id = '',
    required this.userId,
    required this.contactPerson,
    required this.phone,
    required this.addressName,
    this.locality = '',
    this.landmark = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'contact_person': contactPerson,
        'phone': phone,
        'address_name': addressName,
        'locality': locality,
        'landmark': landmark,
      };

  static AddressModel fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'],
        userId: json['user_id'],
        contactPerson: json['contact_person'],
        phone: json['phone'],
        addressName: json['address_name'],
        locality: json['locality'],
        landmark: json['landmark'],
      );
}
