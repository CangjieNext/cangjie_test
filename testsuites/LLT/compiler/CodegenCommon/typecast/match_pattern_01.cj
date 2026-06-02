// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:scan match-g\nmatch-y

var a = false
let b = c

enum e {
    c
    | f(() -> Bool)
}

func g() {
    match (b) {
        case f(j: (UInt32, Bool)) => println("Ooops")
        case k => println("match-g")
    }
}

func y() {
    match (b) {
        case f(j: () -> Int64) => println("Ooops")
        case k => println("match-y")
    }
}

main() {
    g()
    y()
}
