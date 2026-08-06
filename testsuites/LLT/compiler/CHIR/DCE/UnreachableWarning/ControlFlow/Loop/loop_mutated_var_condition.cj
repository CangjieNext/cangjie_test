// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Mutation inside a loop prevents value propagation after the loop.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-not "DiagKind":

main() {
    var total = 0
    for (number in 0..3) {
        total += number
    }
    if (total < 0) {
        println("not diagnosed")
    }
}
