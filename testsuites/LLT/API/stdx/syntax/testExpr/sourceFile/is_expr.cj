func test(): Unit {
    b is Int64
    a is String
    (a as String).getOrThrow() is String
}