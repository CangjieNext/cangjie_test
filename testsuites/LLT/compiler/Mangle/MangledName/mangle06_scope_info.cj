// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt -g %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan _CN7default3barHbE10func_innerIG_HG_
// (not CJNATIVE) ASSERT: scan define internal i1 @_ZN7default3bar10func_innerIbS9a0a0a0b_bEb
// Test two func_inner in if branch, scopeLevel == 1
func bar(x: Bool) {
    if (x) {
        func func_inner<T0>(a: T0): T0 {
            a
        }
        func_inner(x);
    } else {
        func func_inner<T0>(a: T0): T0 {
            a
        }
        func_inner(x);
    }
}

main() {
    bar(true)
    return 0
}
