/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga.*
import pkgb.*

class A <: TRA {
    public init(input: Int32) {
        super(input)
    }

    public operator override func **(input: TRA): TRA {
        var ret = A(Int32(Int64(this.a) ** UInt64(input.a)) - 1);
        return ret
    }
    public operator override func *(input: TRA): TRA {
        var ret = A(this.a * input.a - 1);
        return ret
    }
    public operator override func /(input: TRA): TRA {
        var ret = A(this.a / input.a - 1);
        return ret
    }
    public operator override func %(input: TRA): TRA {
        var ret = A(this.a % input.a - 1);
        return ret
    }
    public operator override func +(input: TRA): TRA {
        var ret = A(this.a + input.a - 1);
        return ret
    }
    public operator override func -(input: TRA): TRA {
        var ret = A(this.a - input.a - 1);
        return ret
    }
    public operator override func -(): TRA {
        var ret = A(this.a);
        return ret
    }
}

class B <: TRB {
    public init(input: Int32) {
        super(input)
    }

    public operator override func <<(input: TRB): TRB {
        var ret = B(this.b << input.b - 1);
        return ret
    }
    public operator override func >>(input: TRB): TRB {
        var ret = B(this.b >> input.b - 1);
        return ret
    }
    public operator override func &(input: TRB): TRB {
        var ret = B(this.b & input.b - 1);
        return ret
    }
    public operator override func ^(input: TRB): TRB {
        var ret = B(this.b ^ input.b - 1);
        return ret
    }
    public operator override func |(input: TRB): TRB {
        var ret = B(this.b | input.b - 1);
        return ret
    }
}

main(): Int64 {
    var tra1: TRA = A(6)
    var tra2: TRA = A(2)

    tra1 **= tra2
    if (tra1.a != 35) {
        return 1
    }

    tra1 *= tra2
    if (tra1.a != 69) {
        return 2
    }

    tra1 /= tra2
    if (tra1.a != 33) {
        return 3
    }

    tra1 %= tra2
    if (tra1.a != 0) {
        return 4
    }

    tra1 += tra2
    if (tra1.a != 1) {
        return 5
    }

    tra1 -= -tra2
    if (tra1.a != -2) {
        return 6
    }

    var trb1: TRB = B(6)
    var trb2: TRB = B(2)

    trb1 <<= trb2
    if (trb1.b != 12) {
        return 7
    }

    trb1 >>= trb2
    if (trb1.b != 6) {
        return 8
    }

    trb1 &= trb2
    if (trb1.b != 0) {
        return 9
    }

    trb1 ^= trb2
    if (trb1.b != 1) {
        return 10
    }

    trb1 |= trb2
    if (trb1.b != 1) {
        return 11
    }

    return 0
}
