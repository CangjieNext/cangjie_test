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

struct A<T> {
    public init(a: T) {}
}

func test(): A<Int32> {
    A<Int32>(return A<Int32>(0))
}

main(): Int64 {
    test()
    return 0
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_dce_unreachable_expression_hint
