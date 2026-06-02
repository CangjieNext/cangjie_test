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
// (not O2) ASSERT: scan throwable_40002.cj:19

class A<T> <: Exception {}

extend<T> A<T> {
    public func test():Int64 {
        throw A<Int64>()
    }
}

main() {
    A<Bool>().test()
    return 5 // throw before main.
}
