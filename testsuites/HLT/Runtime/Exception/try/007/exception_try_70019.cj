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
// (not O2) ASSERT: scan exception_try_70019.cj:18
class A <: Exception {}

struct B {
    public B(input: Int64) {
        throw A()
    }
}

main() {
    B(1)
    return 0
}

// ASSERT: scan An exception has occurred
