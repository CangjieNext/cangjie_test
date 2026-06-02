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
// ASSERT:scan -699-17390567.422997

func parm_i_twelve(p1: Int8, p2: Int16, p3: Int32, p4: Int64, p5: Int8, p6: Int16, p7: Int32, p8: Int64, p9: Int8,
    p10: Int16, p11: Int32, p12: Int64): Int64 {
    let Reg0_I: Int32 = p3
    let Reg1_I: Int64 = Int64(p2)
    let Reg2_I: Int8 = p1
    let Reg3_I: Int32 = p7
    let Reg4_I: Int64 = Int64(p6)
    let Reg5_I: Int8 = p5
    let Reg6_I: Int64 = p12
    let Reg7_I: Int64 = Int64(p11)
    let Reg8_I: Int16 = p10

    return (Int64(Reg0_I) + Reg1_I + Int64(Reg2_I) + p4 + Int64(Reg3_I) + Reg4_I
        + Int64(Reg5_I) + p8 - Reg6_I + Reg7_I + Int64(Reg8_I) - Int64(p9))
}

func parm_f_twelve(p1: Float32, p2: Float64, p3: Float32, p4: Float64, p5: Float32, p6: Float64, p7: Float32,
    p8: Float64, p9: Float32, p10: Float64, p11: Float32, p12: Float64): Float64 {
    let Reg0_D: Float64 = Float64(p1)
    let Reg1_D: Float64 = p2
    let Reg2_D: Float64 = Float64(p3)
    let Reg3_D: Float64 = p4
    let Reg4_D: Float64 = Float64(p5)
    let Reg5_D: Float64 = p6
    let Reg6_D: Float64 = Float64(p7)
    let Reg7_D: Float64 = p8
    let Reg9_D: Float64 = Float64(p9)
    let Rega_D: Float64 = p10
    let Regb_D: Float64 = Float64(p11)
    let Regc_D: Float64 = p12
    return (Reg0_D + Reg1_D + Reg2_D + Reg3_D + Reg4_D + Reg5_D + Reg6_D + Reg7_D - Reg9_D + Rega_D - Regb_D + Regc_D)
}

main(): Int64 {
    print(parm_i_twelve(7, 8, -325, 245, 7, 8, -325, 245, 7, 8, -325, 245))
    print(
        parm_f_twelve(258.234, 987.3847, 45662.12345, 8723.00023452, 58.234, -98.73847, 4.566212345, -8723000.345,
            58.234, -98.73847, 4.566212345, -8723000.345))
    return 0
}
