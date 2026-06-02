// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-1: %compiler %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan error: expected 'const' expression guaranteed to be evaluated at compile time
// ASSERT: scan localConsts4.cj:16:46
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

main(): Int64 {
    const i = 1
    for(x in 0 .. 100) {
        println(x)
        const xpto = match(i) { case _ where continue => i
            case _ => 1 + i
        }
    }
    return 0
}