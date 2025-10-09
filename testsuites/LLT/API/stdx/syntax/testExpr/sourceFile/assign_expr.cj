func test(): Unit {
    a = b
    c += b
    a = a + b
    a *= [1, 2, 3]
    a /= match(b) {
        case v: Int64 => v
        case _ => 1
    }
    a -= function(a + b)
    a = if (a + v < b) {
        a + v
    } else {
        b
    }
    a = 1
    a = Varrray<Int64>(10, item: 1)
    a = "abc${a + b}"
    a = A.b
    d &&= e
    d /= e
    d **= e
    d %= e
    a <<= 2
    d ||= e
    a >>= 2
    a -= 2
    a &= b
    a |= b
    a ^= b
}