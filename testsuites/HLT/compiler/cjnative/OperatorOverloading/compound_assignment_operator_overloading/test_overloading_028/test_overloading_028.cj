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

import std.collection.*

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
        var ret = A(-this.a)
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
    var buf: ArrayList<TRA> = ArrayList<TRA>([A(2), A(3), A(4), A(5), A(6), A(7)])

    buf[0] **= buf[1]
    if (buf[0].a != 7) {
        return 1
    }

    buf[1] *= buf[2]
    if (buf[1].a != 11) {
        return 2
    }

    buf[2] /= buf[3]
    if (buf[2].a != -1) {
        return 3
    }

    buf[3] %= buf[4]
    if (buf[3].a != 4) {
        return 4
    }

    buf[4] += buf[5]
    if (buf[4].a != 12) {
        return 5
    }

    buf[4] -= (-buf[5]) - buf[2]
    if (buf[4].a != 18) {
        return 6
    }

    buf[5] <<= buf[3]
    if (buf[5].a != 56) {
        return 7
    }

    buf[5] >>= buf[3]
    if (buf[5].a != 7) {
        return 8
    }

    buf[4] &= buf[5]
    if (buf[4].a != 2) {
        return 4
    }

    buf[3] ^= buf[4]
    if (buf[3].a != 5) {
        return 4
    }

    buf[3] |= buf[4]
    if (buf[3].a != 5) {
        return 4
    }

    return 0
}
