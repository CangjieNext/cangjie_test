/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    if (foo3() != 3) {
        return 3
    }
    return 0
}

func foo(x: (Int32) -> Int32) {
    return x
}

func foo0(x: (Int32) -> Int32) {
    return x(1)
}

func foo3() {
    func foo0(x: Int32): Int32 {
        return x
    }
    let a = foo0
    let b = foo(foo0)
    return a(1) + b(2)
}
// ASSERT: scan sema_ambiguous_use
