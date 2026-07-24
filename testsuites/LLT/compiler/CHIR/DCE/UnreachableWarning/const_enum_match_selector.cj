// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A const enum selector does not make a non-matching match case unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not warning: unreachable

enum State {
    | Ready
    | Stopped
}

main() {
    const state = State.Ready
    match (state) {
        case Stopped => println("not diagnosed")
        case _ => println("fallback")
    }
}
