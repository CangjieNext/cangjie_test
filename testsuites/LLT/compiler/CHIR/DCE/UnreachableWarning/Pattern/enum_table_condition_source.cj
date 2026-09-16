// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify optimized enum tables retain if-let and while-let diagnostic sources.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json -O2 %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_block_in_expression"

enum State {
    | Active(Int64, Int64)
    | Stopped
}

main() {
    const active = State.Active(1, 2)
    if (let Active(1, _) <- active) {
        println("active")
    } else {
        println("unreachable else")
    }

    const stopped = State.Stopped
    while (let Active(1, 2) <- stopped) {
        println("unreachable while body")
        break
    }
}
