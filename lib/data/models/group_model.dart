class GroupResponse {
  String? sId;
  String? name;
  String? image;
  List<Include>? include;
  int? iV;

  GroupResponse({this.sId, this.name, this.image, this.include, this.iV});

  GroupResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    if (json['include'] != null) {
      include = <Include>[];
      json['include'].forEach((v) {
        include!.add(Include.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['image'] = image;
    if (include != null) {
      data['include'] = include!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class Include {
  String? classId;
  String? level;
  String? sId;

  Include({this.classId, this.level, this.sId});

  Include.fromJson(Map<String, dynamic> json) {
    classId = json['classId'];
    level = json['level'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['classId'] = classId;
    data['level'] = level;
    data['_id'] = sId;
    return data;
  }
}
