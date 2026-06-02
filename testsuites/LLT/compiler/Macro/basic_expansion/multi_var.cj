// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:  macro_define.cj %f.expect
// EXEC: %compiler %cmp_macro macro_define.cj
// EXEC: %run_macro %compiler %cmp_opt --debug-macro %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %diff %f.expect %f.macrocall

import test.*

@M[1]
main(): Int64 {
    var i1 = 1 + 1
    var i2 = 3 - 1
    var i3 = 2 * 1
    var i4 = 4 / 2
    var i5 = 5 % 3
    var i6 = 2 << 1
    var i7 = 2 >> 1
    var i8 = 3 & 2
    var i9 = 2 ^ 3
    var i10 = 2 | 0
    var i11 = 2 == 2 && 3 == 3
    var i12 = 3 >= 2 || 2 >= 4
    var i14 = 4 > 2
    var i15 = 5 > 3
    var i16 = 2 != 3

    var flag: Int64 = 2
    var flag1: Int64 = 4
    var flag2: Int64 = 1
    var res1 = i1 == flag
    var res2 = i2 == flag
    var res3 = i3 == flag
    var res4 = i4 == flag
    var res5 = i5 == flag
    var res6 = i6 == flag1
    var res7 = i7 == flag2
    var res8 = i8 == flag
    var res9 = i9 == flag2
    var res10 = i10 == flag

    var f1 = 1.0 + 1.0
    var f2 = 3.0 - 1.0
    var f3 = 2.0 * 1.0
    var f4 = 4.0 / 2.0
    var f6 = 2.1 == 2.1 && 3 == 3
    var f7 = 2.2 >= 2.0 || 2 >= 4
    var f9 = 4.0 > 2.0
    var f10 = 5.4 > 3.0
    var f11 = 2.4 != 3.0

    var flag3: Float64 = 2.0
    var res11 = f1 == flag3
    var res12 = f2 == flag3
    var res13 = f3 == flag3
    var res14 = f4 == flag3

    var p1 = 1.1 + 0.9
    var p2 = 2.1 - 0.1
    var p3 = 2.0 * 1.0
    var p4 = 4.4 / 2.2
    var p6 = 2.1 == 2.1 && 3.1 == 3.1
    var p7 = 3.1 >= 2.3 || 2.3 >= 4.0
    var p9 = 4.2 > 2.3
    var p10 = 5.4 > 3.3
    var p11 = 2.1 != 3.0

    var flag4: Float64 = 2.0
    var res16 = p1 == flag4
    var res17 = p2 == flag4
    var res18 = p3 == flag4
    var res19 = p4 == flag4

    let x: Float64 = 1.0 + 3.0
    let y: Float32 = 1.0 + 3.0
    let z: Float32 = 2.0 + 3.0
    let w: Int32 = 2 + 3

    return 0
}
