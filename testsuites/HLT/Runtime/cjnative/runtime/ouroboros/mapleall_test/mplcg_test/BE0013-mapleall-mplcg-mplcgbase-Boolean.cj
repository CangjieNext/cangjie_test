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
// ASSERT:scan 0361

func foo(): Int16 {
    return 0
}

func bar(): Int32 {
    let before: Int16 = 4
    let Reg0_Z: Int16 = 0
    let after: Int16 = 32

    return Int32(before + Reg0_Z + after)
}

func ifoo(): Int16 {
    return 1
}

main(): Int64 {
    print(foo().toString())
    print(bar().toString())
    print(ifoo().toString())
    return 0
}
