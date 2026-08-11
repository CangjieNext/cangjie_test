// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: an ideal integer literal wrapped in parentheses as the body of a
// generic-call lambda argument (`TypeTest({=> (0)})`). Parentheses must not
// break the propagation of the expected contextual type, so the literal stays
// IDEAL_INT and the generic type argument is unified against `() -> Int32`.
// Before the fix the parenthesized literal was fixed to Int64 too early,
// giving `() -> Int64` and a mismatch against `() -> Int32`.

// EXEC: %compiler %cmp_opt %f -o %output

class TypeTest<T> {
    init(a: T) {}
}

class X {
    public prop car: TypeTest<() -> Int32> {
        get() {
            TypeTest({=> (0)})
        }
    }
}

main() {}