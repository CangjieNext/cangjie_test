/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

unsafe main() {
    assert(TestClass.f1(1, 2, c: 3, d: 4), 2)
    assert(TestClass.f3(1, 2, c: 3, d: 4), 3)
    assert(TestClass.f5(1, 2, c: 3, d: 4), 6)
    assert(TestClass.p1(1, b: 2, c: 3, d: 4), 6)
    assert(TestClass.p2(Son(), b: Son(), c: Son()) is Son, true)
    assert(TestClass.p23(Son(), Son()) is Son, true)
    assert(TestClass.p25(Son(), Son()) is Son, true)
    assert(TestClass.p3(Father(), Father(), 1) is Father, true)
    assert(TestClass.p33(Father(), Father(), 1) is Father, true)
    assert(TestClass.p35(Father(), Father(), 1) is Father, true)

    assert(B.f1(1, 2, c: 3, d: 4), 2)
    assert(B.f3(1, 2, c: 3, d: 4), 3)
    assert(B.f5(1, 2, c: 3, d: 4), 6)
    assert(B.p1(1, b: 2, c: 3, d: 4), 6)
    assert(B.p2(Son(), b: Son(), c: Son()) is Son, true)
    assert(B.p23(Son(), Son()) is Son, true)
    assert(B.p25(Son(), Son()) is Son, true)
    assert(B.p3(Father(), Father(), 1) is Father, true)
    assert(B.p33(Father(), Father(), 1) is Father, true)
    assert(B.p35(Father(), Father(), 1) is Father, true)
}
