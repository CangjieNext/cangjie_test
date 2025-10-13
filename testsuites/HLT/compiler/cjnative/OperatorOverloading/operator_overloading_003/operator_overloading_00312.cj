/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
struct R {
    public operator func [](b: R): Int32 {
        return 1
    }
    public operator func **(b: R): Int32 {
        return 2
    }
    public operator func *(b: R): Int32 {
        return 4
    }
    public operator func /(b: R): Int32 {
        return 8
    }
    public operator func %(b: R): Int32 {
        return 16
    }

    public operator func <<(b: R): Int32 {
        return 256
    }
    public operator func >>(b: R): Int32 {
        return 512
    }
    public operator func <(b: R): Int32 {
        return 1024
    }
    public operator func <=(b: R): Int32 {
        return 2048
    }
    public operator func >(b: R): Int32 {
        return 4096
    }
    public operator func >=(b: R): Int32 {
        return 8192
    }
    public operator func ==(b: R): Int32 {
        return 16384
    }
    public operator func !=(b: R): Int32 {
        return 32768
    }
    public operator func &(b: R): Int32 {
        return 65536
    }
    public operator func ^(b: R): Int32 {
        return 131072
    }
    public operator func |(b: R): Int32 {
        return 262144
    }
    //    operator func ^^(b:R):Int32{
    //    }

}

class D {
    public operator func [](b: D): Int32 {
        return 1
    }
    public operator func **(b: D): Int32 {
        return 2
    }
    public operator func *(b: D): Int32 {
        return 4
    }
    public operator func /(b: D): Int32 {
        return 8
    }
    public operator func %(b: D): Int32 {
        return 16
    }

    public operator func <<(b: D): Int32 {
        return 256
    }
    public operator func >>(b: D): Int32 {
        return 512
    }
    public operator func <(b: D): Int32 {
        return 1024
    }
    public operator func <=(b: D): Int32 {
        return 2048
    }
    public operator func >(b: D): Int32 {
        return 4096
    }
    public operator func >=(b: D): Int32 {
        return 8192
    }
    public operator func ==(b: D): Int32 {
        return 16384
    }
    public operator func !=(b: D): Int32 {
        return 32768
    }
    public operator func &(b: D): Int32 {
        return 65536
    }
    public operator func ^(b: D): Int32 {
        return 131072
    }
    public operator func |(b: D): Int32 {
        return 262144
    }
    //    operator func ^^(b:D):Int32{
    //    }

}

interface I {
    operator func [](b: I): Int32 {
        return 1
    }
    operator func **(b: I): Int32 {
        return 2
    }
    operator func *(b: I): Int32 {
        return 4
    }
    operator func /(b: I): Int32 {
        return 8
    }
    operator func %(b: I): Int32 {
        return 16
    }

    operator func <<(b: I): Int32 {
        return 256
    }
    operator func >>(b: I): Int32 {
        return 512
    }
    operator func <(b: I): Int32 {
        return 1024
    }
    operator func <=(b: I): Int32 {
        return 2048
    }
    operator func >(b: I): Int32 {
        return 4096
    }
    operator func >=(b: I): Int32 {
        return 8192
    }
    operator func ==(b: I): Int32 {
        return 16384
    }
    operator func !=(b: I): Int32 {
        return 32768
    }
    operator func &(b: I): Int32 {
        return 65536
    }
    operator func ^(b: I): Int32 {
        return 131072
    }
    operator func |(b: I): Int32 {
        return 262144
    }
    //    operator func ^^(b:I):Int32{
    //    }

}

class A <: I {}

main(): Int64 {
    var a: I = A()
    var c = D()
    var r = R()
    var i: Int32 = 0
    var res1 = (a[a]) + (a ** a) + (a * a) + (a / a) + (a % a)
        + (a << a) + (a >> a) + (a < a) + (a <= a)
        + (a > a) + (a >= a) + (a == a) + (a != a) + (a & a) + (a ^ a) + (a | a)

    var res2 = (c[c]) + (c ** c) + (c * c) + (c / c) + (c % c)
        + (c << c) + (c >> c) + (c < c) + (c <= c)
        + (c > c) + (c >= c) + (c == c) + (c != c) + (c & c) + (c ^ c) + (c | c)

    var res3 = (r[r]) + (r ** r) + (r * r) + (r / r) + (r % r)
        + (r << r) + (r >> r) + (r < r) + (r <= r)
        + (r > r) + (r >= r) + (r == r) + (r != r) + (r & r) + (r ^ r) + (r | r)

    if (res1 != 524063) {
        return 1
    }
    if (res2 != 524063) {
        return 2
    }
    if (res3 != 524063) {
        return 3
    }
    return 0
}
