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
// ASSERT:scan 97123.882126-998-45250-45073.5062914566167369

func parm_i_f_mixed_0(i1: Int8, f1: Float32, i2: Int16, f2: Float64, i3: Int32, f3: Float64, i4: Int64, f4: Float32): Int64 {
    return (Int64(i1) + Int64(f2) - Int64(i2) + Int64(f2) - Int64(i3) + Int64(f3) - i4 + Int64(f4))
}

func parm_i_f_mixed_1(i1: Int32, i2: Int32, i3: Int64, f1: Float64, f2: Float32, f3: Float64): Float32 {
    return (Float32(i1) + Float32(i2) - Float32(i3) + Float32(f1) - f2 + Float32(f3))
}

func parm_i_f_mixed_2(i1: Int64, i2: Int64, f1: Float32, f2: Float64, f3: Float64, i3: Int32): Int32 {
    return (Int32(i1) + Int32(i2) - Int32(f1) + Int32(f2) - Int32(f3) + i3)
}

func parm_f_i_mixed_0(f1: Float32, i1: Int16, f2: Float64, i2: Int32, f3: Float64, i3: Int64, f4: Float32, i4: Int8): Int64 {
    return (Int64(f1) + Int64(i1) - Int64(f2) + Int64(i2) - Int64(f3) + i3 - Int64(f4) + Int64(i4))
}

func parm_f_i_mixed_1(f1: Float32, f2: Float64, f3: Float32, i1: Int32, i2: Int32, i3: Int64): Float64 {
    return (Float64(f1) + f2 - Float64(f3) + Float64(i1) - Float64(i2) + Float64(i3))
}

func parm_f_i_mixed_2(f1: Float32, f2: Float64, i1: Int64, i2: Int32, f3: Float64, f4: Float32, i3: Int32, i4: Int64): Int64 {
    return (Int64(f1) + Int64(f2) - i1 + Int64(i2) - Int64(f3) + Int64(f4) - Int64(i3) + i4)
}

main(): Int64 {
    print(parm_i_f_mixed_0(7, 0.8, -325, 2.3, 245, 2.3333, 0, 4.2))
    print(parm_i_f_mixed_1(3, -4, -123, 5.0731234, 2.143, -1.048))
    print(parm_i_f_mixed_2(3, -4, -1.12223, 50.731234, 0.0023, -1048))
    print(parm_f_i_mixed_0(258.234, 987, 45662.12345, 8, 723.0002345, 9, 2.33333, -125))
    print(parm_f_i_mixed_1(258.234, 987.3847, 45662.12345, 8, 723, 58))
    print(parm_f_i_mixed_2(258.234, 987.3847, 45662, 8, 723.00023452, 58.234, -98, 4566212345))
    return 0
}
