func test(): Unit {
    throw Exception("Exception!")
    throw Exception("${Exception(a)}")
    throw Exception("${Exception(a.b)}")
}