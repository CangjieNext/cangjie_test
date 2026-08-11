// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: overload resolution involving an immediately-invoked lambda
// (`gooe({=> return 0}())`). The literal `0` in the lambda body is an ideal
// integer, so it must be able to drive overload resolution just like a plain
// literal `gooe(0)`: when the overloads are distinguishable by the literal's
// integer-ness (Int32 vs Float64), it should pick the integer overload. Before
// the fix the lambda return type degraded to Int64 and matched neither.

// EXEC: %compiler %cmp_opt %f -o %output

func gooe(a: Int32): Unit {}
func gooe(a: Float64): Unit {}

func foole() {
    gooe({=> return 0}())
}

main() {}