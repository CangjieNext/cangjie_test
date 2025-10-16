func test(): Unit {
    foo(100)
    foo1("a", "b", isEmpty: true, inout a)

    foo(   inout a)
    foo2("a", 'b', [1, 2, 3], Varrray<Int64>(10, item: 1), A.b + A.c, function(a, c))
}