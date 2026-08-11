// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: ideal integer literal inside a lambda that is a direct argument
// of a generic call must keep its IDEAL_INT type pending during generic type
// argument inference, so it can be unified against the expected contextual type.
// Here the expected type is `TypeTest<() -> Int32>` carried by a property's
// declared return type. Before the fix the literal `0` was fixed to Int64 too
// early and inference failed with "unable to infer generic argument".

// EXEC: %compiler %cmp_opt %f %compile_lib_opt -o %output

class TypeTest<T> {
    init(a: T) {}
}

class X {
    public prop car: TypeTest<() -> Int32> {
        get() {
            TypeTest({=> 0})
        }
    }
}

main() {}
