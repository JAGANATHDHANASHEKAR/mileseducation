// ignore_for_file: prefer_collection_literals, file_names

class AboutUsResponseData {
  String? systemResourceId;
  String? systemPropertyId;
  String? systemPropertyValue;
  String? description;
  String? docTypeId;
  String? createdStamp;
  String? lastUpdatedStamp;

  AboutUsResponseData(
      {this.systemResourceId,
      this.systemPropertyId,
      this.systemPropertyValue,
      this.description,
      this.docTypeId,
      this.createdStamp,
      this.lastUpdatedStamp});

  AboutUsResponseData.fromJson(Map<String, dynamic> json) {
    systemResourceId = json['systemResourceId'];
    systemPropertyId = json['systemPropertyId'];
    systemPropertyValue = json['systemPropertyValue'];
    description = json['description'];
    docTypeId = json['docTypeId'];
    createdStamp = json['createdStamp'];
    lastUpdatedStamp = json['lastUpdatedStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['systemResourceId'] = systemResourceId;
    data['systemPropertyId'] = systemPropertyId;
    data['systemPropertyValue'] = systemPropertyValue;
    data['description'] = description;
    data['docTypeId'] = docTypeId;
    data['createdStamp'] = createdStamp;
    data['lastUpdatedStamp'] = lastUpdatedStamp;
    return data;
  }
}
