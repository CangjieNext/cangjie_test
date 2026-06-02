// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen --fast-math %n.cj 2>&1 | compare %f

// ASSERT: scan fast double

let a = 369.3299304675746
let b = 6.755399441055744e15

func f(x: Float64) {
    b + x * a - b
}

main() {
    print(f(1.0))
    0
}
