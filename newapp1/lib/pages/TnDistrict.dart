// To parse this JSON data, do
//
//     final tnDistrict = tnDistrictFromJson(jsonString);

import 'dart:convert';

List<TnDistrict> tnDistrictFromJson(String str) => List<TnDistrict>.from(json.decode(str).map((x) => TnDistrict.fromJson(x)));

String tnDistrictToJson(List<TnDistrict> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TnDistrict {
    TnDistrict({
        this.state,
        this.statecode,
        this.districtData,
    });

    String state;
    String statecode;
    List<DistrictDatum> districtData;

    factory TnDistrict.fromJson(Map<String, dynamic> json) => TnDistrict(
        state: json["state"],
        statecode: json["statecode"],
        districtData: List<DistrictDatum>.from(json["districtData"].map((x) => DistrictDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "state": state,
        "statecode": statecode,
        "districtData": List<dynamic>.from(districtData.map((x) => x.toJson())),
    };
}

class DistrictDatum {
    DistrictDatum({
        this.district,
        this.notes,
        this.active,
        this.confirmed,
        this.deceased,
        this.recovered,
        this.delta,
    });

    String district;
    String notes;
    int active;
    int confirmed;
    int deceased;
    int recovered;
    Delta delta;

    factory DistrictDatum.fromJson(Map<String, dynamic> json) => DistrictDatum(
        district: json["district"],
        notes: json["notes"],
        active: json["active"],
        confirmed: json["confirmed"],
        deceased: json["deceased"],
        recovered: json["recovered"],
        delta: Delta.fromJson(json["delta"]),
    );

    Map<String, dynamic> toJson() => {
        "district": district,
        "notes": notes,
        "active": active,
        "confirmed": confirmed,
        "deceased": deceased,
        "recovered": recovered,
        "delta": delta.toJson(),
    };
}

class Delta {
    Delta({
        this.confirmed,
        this.deceased,
        this.recovered,
    });

    int confirmed;
    int deceased;
    int recovered;

    factory Delta.fromJson(Map<String, dynamic> json) => Delta(
        confirmed: json["confirmed"],
        deceased: json["deceased"],
        recovered: json["recovered"],
    );

    Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "deceased": deceased,
        "recovered": recovered,
    };
}
