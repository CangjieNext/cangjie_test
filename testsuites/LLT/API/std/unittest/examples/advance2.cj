/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-0: %run %run_opt %output %run_utest_opt

// a simple class containing 4 strings
class SimpleStorage {
    SimpleStorage() {}
    let v1: String = "1"
    let v2: String = "2"
    let v3: String = "3"
    let v4: String = "4"
}

extend SimpleStorage <: DataProvider<String> {
    public func provide(): Iterable<String> {
        return [v1, v2, v3, v4]
    }
}

extend SimpleStorage <: DataStrategy<String> {
    public func provider(_: Configuration): DataProvider<String> {
        return this
    }
    public prop isInfinite: Bool {
        get() {
            false
        }
    }
}

// SimpleStorage can now be used in data DSL as a source of String
@Test[x in SimpleStorage()]
func foo(x: String): Unit {
    @Expect(x.size > 0)
}
// case from unittest_lib.md, if it's updated, pls update unittest_lib.md as well.
