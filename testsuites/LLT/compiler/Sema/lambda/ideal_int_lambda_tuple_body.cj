// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: ideal integer literals as tuple elements in the body of a
// generic-call lambda argument (`TypeTest({ => (0, 0) })`). The literals must
// stay pending so the tuple result stays `(IDEAL_INT, IDEAL_INT)` and the
// generic type argument can be unified against the expected
// `() -> (Int32, Int32)`. Before the fix the elements were fixed to Int64 too
// early, giving `() -> (Int64, Int64)` and a mismatch.

// EXEC: %compiler %cmp_opt %f -o %output

class TypeTest<T> {
    init(a: T) {}
}

class X {
    public prop car: TypeTest<() -> (Int32, Int32)> {
        get() {
            TypeTest({ => (0, 0) })
        }
    }
}

main() {}