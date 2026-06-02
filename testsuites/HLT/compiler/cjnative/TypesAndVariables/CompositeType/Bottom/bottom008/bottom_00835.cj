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
    public static func test<X>(a: X, b: X): Int64 {
        2
    }
}

// func test():Int64 = A<Bool>.test<Bool>(return 0,return 1)

func test(): Int64 {
    A<Bool>.test<Bool>(return 0, return 1)
}

main(): Int64 {
    return test()
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_dce_unreachable_expression_hint
