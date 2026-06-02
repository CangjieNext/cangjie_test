/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color

open class Base {
    public open func str() {
        "Base"
    }
}

class Derived <: Base {
    public func str() {
        "Derived"
    }
}

@UnittestOption[Base](opt)

@Test
func test_that_derived_type_overwrite_parent_type_value_in_configuration() {
    let conf = Configuration()

    conf.set(KeyOpt.opt, Base())
    let first = conf.get(KeyOpt.opt).getOrThrow()
    @PowerAssert(first.str() == "Base")

    conf.set(KeyOpt.opt, Derived())
    let second = conf.get(KeyOpt.opt).getOrThrow()
    @PowerAssert(second.str() == "Derived")
}

@UnittestOption[Base, Int](qwe)

@Test
func test_that_derived_type_do_not_overwrite_other_types() {
    let conf = Configuration()

    conf.set(KeyQwe.qwe, 42)
    let n = conf.get<Int>(KeyQwe.qwe).getOrThrow()
    @PowerAssert(n == 42)

    conf.set(KeyQwe.qwe, Derived())
    let second = conf.get<Base>(KeyQwe.qwe).getOrThrow()
    @PowerAssert(second.str() == "Derived")

    let n2 = conf.get<Int>(KeyQwe.qwe).getOrThrow()
    @PowerAssert(n2 == 42)
}
