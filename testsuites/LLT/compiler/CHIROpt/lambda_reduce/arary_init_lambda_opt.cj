// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux) EXEC-PIPE-0: %compiler %enableO2 %debugCHIROpt %cmp_opt %n.cj -o %output | compare %f
// (Linux) RUN-EXEC-PIPE-0: %run %output
// (Linux) ASSERT: scan-2 The Apply node in the line:12 and the column:13, was optimized by functionInlineForLambda

main() {
    let f = Array<Int64>(6, {i: Int64 => i}) // inline array init func and lambda
    println(f[1])
    0
}

