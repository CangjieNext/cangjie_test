// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Known enum and Option constructors make non-matching cases unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_unreachable_pattern"

enum State {
    | Ready
    | Stopped
}

func enumSelector() {
    const state = State.Ready
    match (state) {
        case Stopped => println("unreachable stopped case")
        case _ => println("enum fallback")
    }
}

func optionSelector() {
    const option = Option<Int64>.Some(1)
    match (option) {
        case None => println("unreachable None case")
        case _ => println("Option fallback")
    }
}

main() {
    enumSelector()
    optionSelector()
}
