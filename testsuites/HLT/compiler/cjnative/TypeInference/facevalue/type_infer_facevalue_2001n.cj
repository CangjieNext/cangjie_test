/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

func foo1(): Int8 {
    1 + 1 + 2.0
}

func foo3(): Int64 {
    var i: Float32 = 10
    3 / 2 + i
}

func foo4(): Float64 {
    3 / 2 + 10
}

main(): Int64 {
    var res4: Float64 = foo4()
    if (res4 != 11.5) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_invalid_binary_expr
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_mismatched_types
