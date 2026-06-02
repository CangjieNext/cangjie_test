/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 131.167300154.093300-254.000000-236.000000

func fu_i_nine(p1: Int8, p2: Int16, p3: Int32, p4: Int64, p5: Int8, p6: Int16, p7: Int32, p8: Int64, p9: Int8): Int64 {
    return (Int64(p1) + Int64(p2) - Int64(p3) + p4 + Int64(p5) - Int64(p6) + Int64(p7) + p8 + Int64(p9))
}

func fu_i_thirteen(p1: Int8, p2: Int16, p3: Int32, p4: Int64, p5: Int8, p6: Int16, p7: Int32, p8: Int64, p9: Int8,
    p10: Int16, p11: Int32, p12: Int64, p13: Int32): Int64 {
    let Reg0_I: Int32 = p3
    let Reg1_I: Int64 = Int64(p2)
    let Reg2_I: Int8 = p1
    let Reg3_I: Int32 = p7
    let Reg4_I: Int64 = Int64(p6)
    let Reg5_I: Int8 = p5
    let Reg6_I: Int32 = Int32(p12)
    let Reg7_I: Int64 = Int64(p11)
    let Reg8_I: Int8 = Int8(p10)
    return (Int64(Reg0_I) + Reg1_I + Int64(Reg2_I) + p4 + Int64(Reg3_I) + Reg4_I + Int64(Reg5_I) + p8 - Int64(Reg6_I) +
        Reg7_I + Int64(Reg8_I) - Int64(p9) + Int64(p13))
}

func fu_f_twelve(p1: Float32, p2: Float64, p3: Float32, p4: Float64, p5: Float32, p6: Float64, p7: Float32, p8: Float64,
    p9: Float32, p10: Float64, p11: Float32, p12: Float64): Float64 {
    let Reg0_D = Float64(p1)
    let Reg1_D = p2
    let Reg2_D = Float64(p3)
    let Reg3_D = p4
    let Reg4_D = Float64(p5)
    let Reg5_D = p6
    let Reg6_D = Float64(p7)
    let Reg7_D = p8
    let Reg9_D = Float64(p9)
    let Rega_D = p10
    let Regb_D = Float64(p11)
    let Regc_D = p12
    return (Reg0_D + Reg1_D + Reg2_D + Reg3_D + Reg4_D + Reg5_D + Reg6_D + Reg7_D - Reg9_D + Rega_D - Regb_D + Regc_D)
}

func fu_calls_13_and_12(a: Int64, b: Float64): Float64 {
    var r0: Int64 = 0
    var r1: Float64 = 0.0
    if (a > 0) {
        r0 = fu_i_thirteen(Int8(7), Int16(8), Int32(-325), a, Int8(7), Int16(8), Int32(a), Int64(245), Int8(7), Int16(8),
            Int32(-325), Int64(245), Int32(234))
    } else {
        r1 = fu_f_twelve(Float32(3.14), b, Float32(3.33), b, Float32(-1.23), b, Float32(1.22), b, Float32(-3.0733), b,
            Float32(-4.23), b)
    }
    r0 += fu_i_nine(Int8(7), Int16(8), Int32(-325), a, Int8(9), Int16(245), Int32(7), Int64(8), Int8(-3))
    return (Float64(r0) + r1)
}

main(): Int64 {
    print(fu_calls_13_and_12(0, 0.234).toString())
    print(fu_calls_13_and_12(-3, 4.555).toString())
    print(fu_calls_13_and_12(5, -7.340).toString())
    print(fu_calls_13_and_12(11, 8.224).toString())
    return 0
}
