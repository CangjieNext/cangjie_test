// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %enableFuncInlining %debugCHIROpt %cmp_opt %n.cj -o %output | compare %f
// (DEBUG_OPTION)RUN-EXEC-PIPE-0: %run %output
// (CJNATIVE) ASSERT: scan The Apply node in the line:23 and the column:9, was optimized by functionInlineForLambda
// (CJNATIVE) ASSERT: scan The Apply node in the line:20 and the column:13, was optimized by functionInlineForLambda
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

main() {
    let num = 9
    func goo<T>(x: T): T {
        x
    }
    var abc = 8
    let a = {
        =>
        var j = 2
        goo<Int64>(j)
    }()
    a - 2
}
