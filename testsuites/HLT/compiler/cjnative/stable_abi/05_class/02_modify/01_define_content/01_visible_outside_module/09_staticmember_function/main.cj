/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

unsafe main() {
    assert(TestClass.f1(), 1)
    assert(TestClass.f4(), 3)
    assert(TestClass.f6(), 5)
    assert(TestClass.f7(), 7)
    assert(TestClass.f9(), 9)
    assert(TestClass.f13(), 13)
    assert(TestClass.f14(), 14)
    assert(TestClass.g1<Int64, Int64, Son>(1, 2, Son()), "12")
    assert(TestClass.g2<Int64, String, Son>(1, "a", Son()), "1")
    assert(TestClass.p1(1, b: 2, c: 3), 6)
    assert(TestClass.p2(Son(), b: Son()) is Son, true)
    assert(TestClass.p3(Father(), b: Father()) is Father, true)
    assert(TestClass.body1(), 1)
    assert(TestClass.body2(), 2)
    assert(TestClass.body3(), 3)
    checker()
}
