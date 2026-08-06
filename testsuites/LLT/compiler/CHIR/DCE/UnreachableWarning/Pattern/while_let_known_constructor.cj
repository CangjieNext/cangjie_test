// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify known non-matching Option and enum constructors skip while-let bodies.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_block_in_expression"

enum State {
    | Ready
    | Stopped
}

func enumDoesNotMatch() {
    let state = State.Stopped
    while (let Ready <- state) {
        println("dead enum while-let body")
    }
}

func noneDoesNotMatch() {
    let value = Option<Int64>.None
    while (let Some(number) <- value) {
        println(number)
    }
}

main() {
    enumDoesNotMatch()
    noneDoesNotMatch()
}
