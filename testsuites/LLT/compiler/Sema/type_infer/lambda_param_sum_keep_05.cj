// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %diag_json %f -o %output 2>&1 | compare %f

// Guard for the issue #927 fix: when the member usage has explicit generic
// arguments, coverage must be computed only from members with the same function
// generic arity. `x.pick<Int64>(1)` matches `pick<R>(x: Int64)`, but must not
// use `pick(x: T)` to conclude that A<T>'s T is determined. If genArity is
// ignored while collecting coverage, A<T> is kept in the sum together with B,
// and the lambda parameter remains ambiguous.

class A<T> {
    public func pick(x: T): Int64 { 0 }
    public func pick<R>(x: Int64): Int64 { 1 }
}

class B {
    public func pick<R>(x: Int64): Int64 { 2 }
}

main() {
    let f = {x => x.pick<Int64>(1)}
    return 0
}

// ASSERT: scan sema_lambdaExpr_must_have_type_annotation