class PaginationEntity {
    final int? count;
    final String? next;
    final String? previous;
    final List<ResultEntity>? results;

    PaginationEntity({
        this.count,
        this.next,
        this.previous,
        this.results,
    });
}

class ResultEntity {
    final String? name;
    final String? url;

    ResultEntity({
        this.name,
        this.url,
    });
}
