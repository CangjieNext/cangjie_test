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

// ASSERT: scan expected declaration, found 'x'
// ASSERT: scan An exception has occurred:
// ASSERT: scan parsing decl fragment error.
internal import std.ast.*

main() {
    let x = quote(class A {
        x
    })
    parseDeclFragment(x)
    0
}
