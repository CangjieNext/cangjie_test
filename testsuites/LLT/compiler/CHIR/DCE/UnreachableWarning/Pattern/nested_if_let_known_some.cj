// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A known nested Some value makes the failed if-let else branch unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    let value = Option<Option<Int64>>.Some(Option<Int64>.Some(1))
    if (let Some(Some(number)) <- value) {
        println(number)
    } else {
        println("dead nested Some else")
    }
}
