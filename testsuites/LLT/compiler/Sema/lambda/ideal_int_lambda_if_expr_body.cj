// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: ideal integer literals in the then/else branches of an if
// expression used as the body of a generic-call lambda argument
// (`TypeTest({ => if (true) { 0 } else { 1 } })`). The literals must stay
// pending so the if-expression result stays IDEAL_INT and the generic type
// argument can be unified against the expected `() -> Int32`. Before the fix
// the branch bodies were fixed to Int64 too early, giving `() -> Int64` and a
// mismatch against `() -> Int32`.

// EXEC: %compiler %cmp_opt %f -o %output

class TypeTest<T> {
    init(a: T) {}
}

class X {
    public prop car: TypeTest<() -> Int32> {
        get() {
            TypeTest({ => if (true) { 0 } else { 1 } })
        }
    }
}

main() {}