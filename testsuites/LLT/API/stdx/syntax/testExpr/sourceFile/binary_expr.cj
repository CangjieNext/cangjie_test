func funcBinaryExpr(): Unit {
    a + b
    a<b, c, d> == 3
    a - b
    a * b
    a / b
    a % b
    a ** 2
    a > b
    a < b
    a >= b
    a <= b
    a != b
    a += b
    a -= b
    a *= b
    a /= b
    a %= b
    a <<= b
    a >>= b
    a **= 2
    a & b
    a | b
    a &= b
    a |= b
    a ^ b
    a ^= b
    a = a + b
    a + [1, 2, 3]
    a - match(b) {
        case v: Int64 => v
        case _ => 1
    }
    a * function(a + b)
    a / if (a + v < b) {
        a + v
    } else {
        b
    }
    a + 1
    a + Varrray<Int64>(10, item: 1)
    a + "abc${a + b}"
    A.b + A.c
    (A.b) ?? 0
    a << 2
    a >> 2
    a || b
    a |> b
    a && b
    a ~> b
}