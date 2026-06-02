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
    assert(TestClass.f8() == 8 || TestClass.f8() == 15, true)
    assert(TestClass.f10() == 10 || TestClass.f10() == 19, true)
    checker()
}
