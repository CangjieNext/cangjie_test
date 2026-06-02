// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug %n.cj 2>&1 | compare %f

// ASSERT: scan _CN7default1aE

let a = 9

main(): Int64 {
    println(a)
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
