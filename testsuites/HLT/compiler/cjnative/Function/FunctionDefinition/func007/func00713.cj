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

open class A {
    protected open func test(a!: Int64): Int64 {
        return a
    }
}

class B <: A {
    protected override func test(a!: Int64): Int64 {
        return a + 1
    }
}

main(): Int64 {
    return B().test(a: -1)
}
