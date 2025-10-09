func test(): Unit {
    for ((x, y) in array) {}
    for (i in 0..10 where i % 2 == 1) {
        println(i)
    }
}