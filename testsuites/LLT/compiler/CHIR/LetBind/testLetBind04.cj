// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A {
    public var x: Int64
    public init(input: Int64) {
        x = input
    }

    public operator func -(): A {
        return A(-this.x)
    }
    public operator func -(input: A): A {
        return A(this.x - input.x - 2)
    }
    public operator func +(input: A): A {
        return A(this.x + input.x - 2)
    }
    public operator func **(input: A): A {
        return A(this.x ** UInt64(input.x - 34) + 1)
    }
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
    public operator func !=(input: Int64): Bool {
        return this.x != input
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
    if (b.y != 18) {
        return 1
    }
    b.y -= -b.y
    if (b.y != 34) {
        return 2
    }
    b.y **= b.y
    if (b.y != 2) {
        return 3
    }
    b.y *= b.y
    if (b.y != 2) {
        return 4
    }
    b.y /= b.y
    if (b.y != 3) {
        return 5
    }
    b.y %= b.y
    if (b.y != 2) {
        return 6
    }
    b.y <<= b.y
    if (b.y != 2) {
        return 7
    }
    b.y >>= b.y
    if (b.y != 2) {
        return 8
    }
    b.y &= b.y
    if (b.y != 0) {
        return 9
    }
    b.y ^= b.y
    if (b.y != -2) {
        return 10
    }
    b.y |= b.y
    if (b.y != -2) {
        return 11
    }

    return 0
}
