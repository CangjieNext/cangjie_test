/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

unsafe main() {
    let t = TestClass()
    assert(TestClass.f1() is Father, true)
    assert(TestClass.f3(Father(), Son()) is Father, true)
    assert(TestClass.f5() is Father, true)
    assert(TestClass.g1() is Son, true)
    assert(TestClass.g3(Father(), Son()) is Son, true)
    assert(TestClass.g5() is Son, true)

    assert(B.f1() is Father, true)
    assert(B.f3(Father(), Son()) is Father, true)
    assert(B.f5() is Father, true)
    assert(B.g1() is Son, true)
    assert(B.g3(Father(), Son()) is Son, true)
    assert(B.g5() is Son, true)
    checker()
}
