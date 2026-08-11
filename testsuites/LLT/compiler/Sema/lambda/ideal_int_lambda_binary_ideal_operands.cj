// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: ideal integer literals as both operands of a binary expression
// inside a generic-call lambda argument (`TypeTest({=> 0 + 0})`). Both `0`
// operands are IDEAL_INT; they must stay pending so the binary result stays
// IDEAL_INT and the generic type argument can be unified against the expected
// contextual type `() -> Int32`. Before the fix the right operand was fixed
// to Int64 too early, giving `Int64 + Int64 -> Int64` and a mismatch against
// `() -> Int32`. A literal whose type is already concrete (e.g. `count() + 1`)
// is still replaced as usual, so stdlib is unaffected.

// EXEC: %compiler %cmp_opt %f -o %output

class TypeTest<T> {
    init(a: T) {}
}

class X {
    public prop car: TypeTest<() -> Int32> {
        get() {
            TypeTest({=> 0 + 0})
        }
    }
}

main() {}