// EXEC-PIPE-0: %compiler %cmp_opt %debugCHIROpt %enableO2 %n.cj -o %output | compare %f
// RUN-EXEC-PIPE-0: %run %output
// ASSERT: scan [ArrayLambda] The call to arrayInitByFunction at [12,17] has been optimised to a call to arrayInitByValue.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import std.collection.*

main() {
    var sum = 0
    for (i in 0..100) {
        var a = ArrayList<Int64>(100000, {i => 2})
        sum += a[i]
    }
    return sum - 200
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
