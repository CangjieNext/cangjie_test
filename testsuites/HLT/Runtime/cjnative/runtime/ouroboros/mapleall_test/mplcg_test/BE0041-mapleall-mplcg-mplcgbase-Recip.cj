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
// ASSERT:scan -0.806452-0.8064520.813008294.1176450.0000810.813008294.1176470.000081

func recip_f64(i: Float64): Float64 {
    return (1.0 / i)
}

func recip_f32(i: Float32) {
    return (1.0 / i)
}

func recip_f64imm(): Float64 {
    return (1.0 / -1.24)
}

func recip_f32imm(): Float32 {
    return (1.0 / -1.24)
}

main(): Int64 {
    print(recip_f32imm())
    print(recip_f64imm())

    print(recip_f32(1.23))
    print(recip_f32(0.0034))
    print(recip_f32(12345.0034))

    print(recip_f64(1.23))
    print(recip_f64(0.0034))
    print(recip_f64(12345.0034))

    return 0
}
