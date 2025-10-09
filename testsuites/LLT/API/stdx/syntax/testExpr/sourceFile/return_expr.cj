func test(): Int64 {
    return 1
}

func test_null() {
    return
}

func test1() {
    return A.a + b
}

func test2() {
    return [1, 2, 3]
}

func test3() {
    return match(b) {
        case v: Int64 => v
        case _ => 1
    }
}

func test4() {
    return function(a + b)
}

func test5() {
    return if (a + v < b) {
        a + v
    } else {
        b
    }
}

func test6() {
    return Varrray<Int64>(10, item: 1)
}

func test7() {
    return "abc${a + b}"
}