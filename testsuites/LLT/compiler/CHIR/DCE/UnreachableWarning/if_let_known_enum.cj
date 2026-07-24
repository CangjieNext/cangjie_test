// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A known enum constructor does not make an if-let else branch unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not warning: unreachable

enum State {
    | Ready
    | Stopped
}

main() {
    let state = State.Ready
    if (let Ready <- state) {
        println("ready")
    } else {
        println("not diagnosed")
    }
}
