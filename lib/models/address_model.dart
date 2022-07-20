class AddressModel {
  String id;
  String userId;
  String contactPerson;
  String phone;
  String address;
  String landmark;
  String longitude;
  String latitude;

  AddressModel({
    this.id = '',
    required this.userId,
    required this.contactPerson,
    required this.phone,
    required this.address,
    this.landmark = '',
    required this.longitude,
    required this.latitude,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'contact_person': contactPerson,
        'phone': phone,
        'address': address,
        'landmark': landmark,
        'longitude': longitude,
        'latitude': latitude,

      };

  static AddressModel fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'],
        userId: json['user_id'],
        contactPerson: json['contact_person'],
        phone: json['phone'],
        address: json['address'],
        landmark: json['landmark'],
        longitude: json['longitude'],
        latitude: json['latitude'],
      );
}
