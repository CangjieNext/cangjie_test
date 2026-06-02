/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (not O2) ASSERT:scan exception_try_20009.cj:20

open class A <: Exception {}

class B <: A {}

main() {
    try {
        throw A()
    } catch (a: B) {
        return 3
    } finally {}
    return 4
}

// ASSERT: scan An exception has occurred
