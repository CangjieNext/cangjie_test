/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not arm) EXEC-PIPE-0: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// (not arm) RUN-EXEC: %run %run_opt %output %run_args
// (not arm) ASSERT: scan chir_dce_unused_variable
interface I {}

struct A <: I {
    static const a = 1
}

extend A {
    static func test() {
        const a = 1
    }
}

main() {
    return 0
}
