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

open class TRA {
    public var a: Int64 = 1
    public init(input: Int64) {
        a = input
    }

    public open operator func **(input: TRA): TRA {
        return TRA(222)
    }
    public open operator func *(input: TRA): TRA {
        return TRA(222)
    }
    public open operator func /(input: TRA): TRA {
        return TRA(222)
    }
    public open operator func %(input: TRA): TRA {
        return TRA(222)
    }
    public open operator func +(input: TRA): TRA {
        return TRA(222)
    }
    public open operator func -(input: TRA): TRA {
        return TRA(222)
    }
    public open operator func -(): TRA {
        return TRA(222)
    }
    public open operator func <<(input: TRA): TRA {
        return TRA(222)
    }
    public open operator func >>(input: TRA): TRA {
        return TRA(222)
    }
    public open operator func &(input: TRA): TRA {
        return TRA(222)
    }
    public open operator func ^(input: TRA): TRA {
        return TRA(222)
    }
    public open operator func |(input: TRA): TRA {
        return TRA(222)
    }
}

class A <: TRA {
    public init(input: Int64) {
        super(input)
    }

    public operator override func **(input: TRA): A {
        var ret = A(this.a ** UInt64(input.a) - 1)
        return ret
    }

    public operator override func *(input: TRA): A {
        var ret = A(this.a * input.a - 1)
        return ret
    }

    public operator override func /(input: TRA): A {
        var ret = A(this.a / input.a - 1)
        return ret
    }

    public operator override func %(input: TRA): A {
        var ret = A(this.a % input.a - 1)
        return ret
    }

    public operator override func +(input: TRA): A {
        var ret = A(this.a + input.a - 1)
        return ret
    }

    public operator override func -(input: TRA): A {
        var ret = A(this.a - input.a - 1)
        return ret
    }

    public operator override func -(): A {
        var ret = A(this.a)
        return ret
    }

    public operator override func <<(input: TRA): A {
        var ret = A(this.a << input.a - 1)
        return ret
    }

    public operator override func >>(input: TRA): A {
        var ret = A(this.a >> input.a - 1)
        return ret
    }

    public operator override func &(input: TRA): A {
        var ret = A(this.a & input.a - 1)
        return ret
    }

    public operator override func ^(input: TRA): A {
        var ret = A(this.a ^ input.a - 1)
        return ret
    }

    public operator override func |(input: TRA): A {
        var ret = A(this.a | input.a - 1)
        return ret
    }
}

main(): Int64 {
    var a1: TRA = A(10)
    var a2: TRA = A(2)

    a1 **= a2
    if (a1.a != 99) {
        return 1
    }

    a1 *= a2
    if (a1.a != 197) {
        return 2
    }

    a1 /= a2
    if (a1.a != 97) {
        return 3
    }

    a1 %= a2
    if (a1.a != 0) {
        return 4
    }

    a1 += a2
    if (a1.a != 1) {
        return 5
    }

    a1 -= (-a2)
    if (a1.a != -2) {
        return 6
    }

    a1 <<= a2
    if (a1.a != -4) {
        return 7
    }

    a1 >>= a2
    if (a1.a != -2) {
        return 8
    }

    a1 &= a2
    if (a1.a != 0) {
        return 9
    }

    a1 ^= a2
    if (a1.a != 1) {
        return 10
    }

    a1 |= a2
    if (a1.a != 1) {
        return 11
    }

    return 0
}
