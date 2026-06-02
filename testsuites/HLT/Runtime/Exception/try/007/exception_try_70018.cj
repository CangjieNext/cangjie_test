/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (not O2) ASSERT: regex init
// (not O2) ASSERT: scan exception_try_70018.cj:24
class A <: Exception {}

open class C {
    public init(a: Int64) {}
}

class B <: C {
    public B(input: Int64) {
        super({
            =>
            throw A();
            1
        }())
    }
}

main() {
    B(1)
    return 0
}

// ASSERT: scan An exception has occurred
