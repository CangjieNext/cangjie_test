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
// ASSERT:scan 13180.450000

func parm_i_f_mixed_eleven(p1: Int8, p2: Float32, p3: Int32, p4: Float64, p5: Float32, p6: Float32, p7: Int64,
    p8: Int64, p9: Float64, p10: Int16, p11: Float32): Int64 {
    return (Int64(p1) + Int64(p2) + Int64(p3) + Int64(p4) - Int64(p5) + Int64(p6)
        + Int64(p7) + Int64(p8) - Int64(p9) + Int64(p10) + Int64(p11))
}

func parm_f_i_mixed_twelve(p1: Float32, p2: Float64, p3: Float32, p4: Int32, p5: Int32, p6: Int32, p7: Int64,
    p8: Float64, p9: Float32, p10: Int64, p11: Int64, p12: Float64): Float64 {
    return (Float64(p1) + Float64(p2) - Float64(p3) + Float64(p4) - Float64(p5)
        + Float64(p6) - Float64(p7) + Float64(p8) - Float64(p9) + Float64(p10)
        + Float64(p11) - Float64(p12))
}

main(): Int64 {
    print(parm_i_f_mixed_eleven(1, 1.2, 3, 3.4, 3.4, 4.6, 72, 35, 12.3, 16, 11.11))
    print(parm_f_i_mixed_twelve(1.2, 2.3, 3.14, 3, 4, 46, 72, 3.5, 12.3, 16, 111, 11.11))
    return 0
}
