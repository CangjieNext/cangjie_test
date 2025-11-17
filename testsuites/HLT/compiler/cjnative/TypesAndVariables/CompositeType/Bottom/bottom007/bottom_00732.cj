/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

class A<T> {
    public var x: T
    public init(a: T, b: T) {
        x = a
    }
}

func test(): A<Int64> {
    A<Int64>((return A<Int64>(0, 0)), (return A<Int64>(1, 1)))
}

main(): Int64 {
    return test().x
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir2_dce_unreachable_expression
