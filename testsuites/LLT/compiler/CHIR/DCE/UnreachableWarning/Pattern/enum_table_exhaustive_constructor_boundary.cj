// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify an exhaustive enum table does not follow its placeholder default into another constructor group.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json -O2 %f -o %output 2>&1 | compare %f

// ASSERT: scan-4 "DiagKind": "chir_unreachable_pattern"

enum State {
    | Left(Int64, Bool)
    | Right(Int64, Bool)
}

func selectRight(flag: Bool): Int64 {
    let state = State.Right(0, flag)
    return match (state) {
        case Left(_, true) => 0
        case Left(_, false) => 1
        case Right(_, true) => 2
        case Right(_, false) => 3
    }
}

func selectLeft(flag: Bool): Int64 {
    let state = State.Left(0, flag)
    return match (state) {
        case Left(_, true) => 0
        case Left(_, false) => 1
        case Right(_, true) => 2
        case Right(_, false) => 3
    }
}

main() {
    println(selectRight(true))
    println(selectLeft(false))
}
