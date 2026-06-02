// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f

// ASSERT: scan-not @llvm.cj.heapmalloc.class

/*
 * Test description: An env object should not exist when there is no captured variables.
 */

func double(x: Int64): Int64 {
    x * 2
}

main(): Int64 {
    let f1 = double
    let f2 = {x: Int64 => x + x}
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
