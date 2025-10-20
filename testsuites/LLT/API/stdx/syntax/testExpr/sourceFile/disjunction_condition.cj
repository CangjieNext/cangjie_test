func test(): Unit {
    if (a == b && let c <- b && c == a && true) {}
    if (a < b || b <= c || c >= d || !aaa || c == e || c != x) {}
    if (a == b || c > d || e <= f || x != y && y > z) {}
    if (a > b && c == d && e > f && let x <- y && true) {}
}