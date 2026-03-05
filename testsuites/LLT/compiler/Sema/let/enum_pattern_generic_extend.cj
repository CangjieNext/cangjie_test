// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Guard: generic enum pattern match in extend. Selector type is EnumTest<EnumTest<Y>>,
// constructor AA has type (X) -> EnumTest<X>; X must substitute to EnumTest<Y> (selector's
// type arg), not to EnumTest<EnumTest<Y>>, so AA type is (EnumTest<Y>) -> EnumTest<EnumTest<Y>>.
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output
// ASSERT: scan default.EnumTest<Int64>

import std.reflect.TypeInfo

public enum EnumTest<X> {
    AA(X)
    | BB
}

extend<Y> EnumTest<Y> {
    public func testFunc(a: EnumTest<EnumTest<Y>>): Int64 {
        if (let AA(x) <- a) {
            println(TypeInfo.of(x))
            return 0
        }
        return 1
    }
}

main(): Int64 {
    let inner: EnumTest<Int64> = AA(1)
    let outer: EnumTest<EnumTest<Int64>> = AA(inner)
    return inner.testFunc(outer)
}
