import 'dart:convert';

import 'package:challenge_banpay/domain/entities/pokemon_pagination_entity.dart';

class PaginationModel extends PaginationEntity {
    final int? count;
    final String? next;
    final String? previous;
    final List<ResultModel>? results;

    PaginationModel({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory PaginationModel.fromRawJson(String str) => PaginationModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PaginationModel.fromJson(Map<String, dynamic> json) => PaginationModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? [] : List<ResultModel>.from(json["results"]!.map((x) => ResultModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class ResultModel extends ResultEntity {
    final String? name;
    final String? url;

    ResultModel({
        this.name,
        this.url,
    });

    factory ResultModel.fromRawJson(String str) => ResultModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
