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

enum A {
    | a(Int64)

    private operator func [](arg1: Int16, arg2: UInt16, arg3: Int8, arg4: UInt8, arg5: Float16, value!: Int64): Unit {
    }
}

main(): Int64 {
    return 0
}
