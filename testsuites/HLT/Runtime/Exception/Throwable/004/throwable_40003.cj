/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception in thread "main" default.A|An exception has occurred
// (not O2) ASSERT: scan throwable_40003.cj:23

class A<T> <: Exception {}

interface I<T> {
    func test(a: T): Unit
}

extend<T> A<T> <: I<T> {
    public func test(a: T):Unit {
        throw A<Int64>();
        return
    }
}

main() {
    A<Int64>().test(1)
    return 5 // throw before main.
}
