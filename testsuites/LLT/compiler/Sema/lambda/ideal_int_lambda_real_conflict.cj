// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Negative counterpart to the ideal_int_lambda_arg_* cases: when the lambda
// body contains an operand of a FIXED integer type (here `y` is inferred as
// Int64 from `let y = 5`), the body type is concretely `() -> Int64` and
// genuinely conflicts with the expected `() -> Int32`. The fix must NOT
// silence this real type mismatch. Both the baseline and the fixed compiler
// report the same "unable to infer generic argument" diagnostic here.

// ERRCHECK: %compiler %cmp_opt %f %compile_lib_opt -o %output
// ASSERT: scan unable to infer generic argument

class TT<T> {
    init(a: T) {}
}

func make() : TT<() -> Int32> {
    let y = 5
    return TT({=> y + 1})
}

main() {}
