// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify that a multi-level else-if chain reports only directly unreachable successors.
// EXEC-PIPE: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-2 warning: unreachable block in 'if' expression
// ASSERT: scan-not ==> else_if_recursion_boundary.cj:17:23:

main() {
    if (false) {
        println("outer then")
    } else if (true) {
        println("reachable")
    } else if (false) {
        println("nested then")
    } else {
        println("nested else")
    }
}
