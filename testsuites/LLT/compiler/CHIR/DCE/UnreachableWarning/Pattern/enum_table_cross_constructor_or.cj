// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify enum table diagnostics group or-pattern alternatives that span constructor groups.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json -O2 %f -o %output 2>&1 | compare %f

// ASSERT: scan-4 "DiagKind": "chir_unreachable_pattern"

enum Mode {
    | Left(Int64)
    | Right(Int64)
    | Done
}

main() {
    const selected = Mode.Left(1)
    let selectedResult = match (selected) {
        case Left(1) | Right(1) => 0
        case _ => 1
    }
    println(selectedResult)

    const done = Mode.Done
    let doneResult = match (done) {
        case Left(1) | Right(1) => 0
        case Left(2) | Right(2) => 1
        case _ => 2
    }
    println(doneResult)
}
