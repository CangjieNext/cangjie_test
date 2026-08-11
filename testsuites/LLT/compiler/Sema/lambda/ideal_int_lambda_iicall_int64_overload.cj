// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Positive: overload resolution for an immediately-invoked lambda argument
// (`gooe({=> return 0}())`) when one of the overloads is `Int64`. The lambda
// body's ideal literal `0` defaults to `Int64`, so it should preferentially
// resolve to the `Int64` overload (same as a plain `gooe(0)`), without any
// ambiguity or mismatch. Guards against the lambda return type being fixed to
// a narrower/wrong integer kind. The run output `Int64` confirms the Int64
// overload is actually selected.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Int64

func gooe(a: Int32): Unit {
    println("Int32")
}

func gooe(a: Int64): Unit {
    println("Int64")
}

func foole() {
    gooe({=> return 0}())
}

main() {
    foole()
}
