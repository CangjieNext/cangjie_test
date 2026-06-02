/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func foo(x: Int8): Int32 {
    return 2 // 2 is inferred to be Int32
}

func foo(x: Int64): Int64 {
    return 3 // 2 is inferred to be Int64
}

func foo(x: Float32): Float64 {
    return 3.0 // 3.0 is inferred to be Float64
}

func foo(x: Float64): Float32 {
    return 3.0 // 3.0 is inferred to be Float32
}

main(): Int64 {
    var i1: Int8 = foo(3)
    var i2: Int32 = foo(3.0)
    return 0
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_no_match_function_declaration_for_call
