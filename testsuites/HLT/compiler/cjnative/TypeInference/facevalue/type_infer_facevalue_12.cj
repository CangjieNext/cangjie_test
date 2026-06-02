/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    // 两个无类型整型表达式进行类型一致性运算 -> 无类型整型
    var i1 = 1 + 1 // 无类型整型 -> Int64
    var i2 = 3 - 1
    var i3 = 2 * 1
    var i4 = 4 / 2
    var i5 = 5 % 3
    var i6 = 2 << 1
    var i7 = 2 >> 1
    var i8 = 3 & 2 // 2
    var i9 = 2 ^ 3 // 1
    var i10 = 2 | 0 // 2
    var i11 = 2 == 2 && 3 == 3
    var i12 = 3 >= 2 || 2 >= 4
    //    var i13 = 2 <= 3 ^^ 2 > 3    //  return true
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

    // 无类型整型表达式和无类型浮点型表达式进行类型一致性运算 -> 无类型浮点型
    var f1 = 1.0 + 1.0 // 无类型整型 -> Int64
    var f2 = 3.0 - 1.0
    var f3 = 2.0 * 1.0
    var f4 = 4.0 / 2.0
    var f6 = 2.1 == 2.1 && 3 == 3
    var f7 = 2.2 >= 2.0 || 2 >= 4
    //    var f8 = 2.2 <= 3.0 ^^ 2 > 3
    var f9 = 4.0 > 2.0
    var f10 = 5.4 > 3.0
    var f11 = 2.4 != 3.0

    var flag3: Float64 = 2.0
    var res11 = f1 == flag3
    var res12 = f2 == flag3
    var res13 = f3 == flag3
    var res14 = f4 == flag3
    // var res15 = f5 == flag3

    //  两个无类型浮点型类型的表达式  -> 无类型浮点型
    var p1 = 1.1 + 0.9 // 无类型浮点型 -> Float64
    var p2 = 2.1 - 0.1
    var p3 = 2.0 * 1.0
    var p4 = 4.4 / 2.2
    var p6 = 2.1 == 2.1 && 3.1 == 3.1
    var p7 = 3.1 >= 2.3 || 2.3 >= 4.0
    // var p8 = 2.3 <= 3.3 ^^ 2.7 > 3.6
    var p9 = 4.2 > 2.3
    var p10 = 5.4 > 3.3
    var p11 = 2.1 != 3.0

    var flag4: Float64 = 2.0
    var res16 = p1 == flag4
    var res17 = p2 == flag4
    var res18 = p3 == flag4
    var res19 = p4 == flag4
    // var res20 = p5 == flag4

    // 无类型表达式和有类型表达式 -> 有类型表达式
    let x: Float64 = 1.0 + 3.0
    let y: Float32 = 1.0 + 3.0 // 无类型浮点型 -> Float32
    let z: Float32 = 2.0 + 3.0 // 无类型整型 -> Float32
    let w: Int32 = 2 + 3

    if (!res1 || !res2 || !res3 || !res4 || !res5 || !res6 || !res7 || !res8 || !res9 || !res10) {
        return 1
    }
    if (!res11 || !res12 || !res13 || !res14) {
        return 1
    }
    if (!res16 || !res17 || !res18 || !res19) {
        return 1
    }
    if (!i11 || !i12 || !i14 || !i15 || !i16) {
        return 1
    }
    if (!f6 || !f7 || !f9 || !f10 || !f11) {
        return 1
    }
    if (!p6 || !p7 || !p9 || !p10 || !p11) {
        return 1
    }
    if (x != 4.0 || y != 4.0 || z != 5.0 || w != 5) {
        return 1
    }
    return 0
}
