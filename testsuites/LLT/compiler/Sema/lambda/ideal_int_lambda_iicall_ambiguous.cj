// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Negative: overload resolution for an immediately-invoked lambda argument
// (`gooe({=> return 0}())`) must report an ambiguous match, exactly like a
// plain literal argument `gooe(0)`. The lambda body's literal `0` is an ideal
// integer that matches both the `Int32` and `Int8` overloads, so the call is
// genuinely ambiguous and the user must pick a type (e.g. `0i32`). Before the
// fix the lambda return type was wrongly fixed to Int64 and the compiler
// reported a misleading "mismatched types" instead of the overload ambiguity.

// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-1 ambiguous match for function call

func gooe(a: Int32): Unit {}
func gooe(a: Int8): Unit {}

func foole() {
    gooe({=> return 0}())
}

main() {}