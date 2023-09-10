class GetBookFile {
  int? totalPages;
  int? limit;
  int? pageNo;
  List<Rows>? rows;

  GetBookFile({this.totalPages, this.limit, this.pageNo, this.rows});

  GetBookFile.fromJson(Map<String, dynamic> json) {
    totalPages = json['total_pages'];
    limit = json['limit'];
    pageNo = json['page_no'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_pages'] = totalPages;
    data['limit'] = limit;
    data['page_no'] = pageNo;
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  int? id;
  String? name;
  int? authorId;
  String? authorName;
  int? noOfPages;
  int? publisherId;
  String? publisherName;
  int? categoryId;
  String? categoryName;
  int? publishYear;
  String? image;
  String? pdf;
  int? createdAt;
  int? updatedAt;

  Rows(
      {this.id,
      this.name,
      this.authorId,
      this.authorName,
      this.noOfPages,
      this.publisherId,
      this.publisherName,
      this.categoryId,
      this.categoryName,
      this.publishYear,
      this.image,
      this.pdf,
      this.createdAt,
      this.updatedAt});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    authorId = json['author_id'];
    authorName = json['author_name'];
    noOfPages = json['no_of_pages'];
    publisherId = json['publisher_id'];
    publisherName = json['publisher_name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    publishYear = json['publish_year'];
    image = json['image'];
    pdf = json['pdf'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['author_id'] = authorId;
    data['author_name'] = authorName;
    data['no_of_pages'] = noOfPages;
    data['publisher_id'] = publisherId;
    data['publisher_name'] = publisherName;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['publish_year'] = publishYear;
    data['image'] = image;
    data['pdf'] = pdf;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
