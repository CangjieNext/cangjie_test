/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not O2) EXEC: %compiler %cmp_opt %f -o %output
// (not O2) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (not O2) ASSERT: regex Exception
// (not O2) ASSERT: regex test
// (not O2) ASSERT: scan throwable_40005.cj:22

class A <: Exception {}

class B <: Exception {}

extend A {
    public func test():Unit {
        throw B()
    }
}

main() {
    A().test()
    return 5 // throw before return.
}
