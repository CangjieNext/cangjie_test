// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Document source forms that current constant propagation intentionally does not prove.
// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not warning: unreachable

enum State {
    | Ready
    | Stopped
}

func matchRange(value: Int64) {
    match (value) {
        case number where number > 0 =>
            if (number < 0) {
                println("not propagated from match guard")
            }
        case _ => println("other range")
    }
}

main() {
    while (let Some(value) <- Option<Int64>.None) {
        println(value)
    }

    while (let Ready <- State.Stopped) {
        println("not propagated enum while let")
    }

    let optional = Option<Int64>.Some(1)
    if (let Some(value) <- optional && value < 0) {
        println(value)
    }

    let base: Any = 1
    let converted = base as String
    if (let value <- converted) {
        println(value)
    }

    matchRange(1)
}
