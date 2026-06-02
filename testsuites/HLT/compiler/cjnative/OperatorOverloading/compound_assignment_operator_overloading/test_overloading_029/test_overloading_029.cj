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

class A {
    public var x: Int64
    public init(input: Int64) {
        x = input
    }

    public operator func -(): A {
        return A(this.x + 1)
    }
    public operator func -(input: A): A {
        return A(this.x - input.x - 2)
    }
    public operator func +(input: A): A {
        return A(this.x + input.x - 2)
    }
    public operator func **(input: A): A {
        return A(this.x ** UInt64(input.x + 3) + 1)
    } // line 37 there b.y.x is (-3) and then input.x - 37 = -40; it will cause runtime exceptions. Therefore I changed the exponent.
    public operator func *(input: A): A {
        return A(this.x * input.x - 2)
    }
    public operator func /(input: A): A {
        return A(this.x / input.x + 2)
    }
    public operator func %(input: A): A {
        return A(this.x % input.x + 2)
    }
    public operator func <<(input: A): A {
        return A(this.x << input.x - 2)
    }
    public operator func >>(input: A): A {
        return A(this.x >> input.x - 2)
    }
    public operator func &(input: A): A {
        return A(this.x & input.x - 2)
    }
    public operator func ^(input: A): A {
        return A(this.x ^ input.x - 2)
    }
    public operator func |(input: A): A {
        return A(this.x | input.x - 2)
    }
}

class B {
    public var y: A
    public init(input: A) {
        y = input
    }
}

main(): Int64 {
    var a: A = A(10)
    var b: B = B(a)

    b.y += b.y
    b.y -= -b.y
    b.y **= b.y
    b.y *= b.y
    b.y /= b.y
    b.y %= b.y
    b.y <<= b.y
    b.y >>= b.y
    b.y &= b.y
    b.y ^= b.y
    b.y |= b.y

    var res1 = b.y
    var res2 = res1.x

    if (res2 == -2) {
        return 0
    } else {
        return 1
    }
}
