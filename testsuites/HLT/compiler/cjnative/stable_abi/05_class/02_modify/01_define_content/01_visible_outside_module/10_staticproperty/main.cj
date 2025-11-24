/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

main() {
    TestClass.prop11 = -1
    assert(TestClass.prop1, 1)
    assert(TestClass._prop3, 3)
    assert(TestClass.prop4, 4)
    assert(TestClass.prop6, 6)
    assert(TestClass.prop10, 10)
    assert(TestClass.prop11, 11)
    assert(TestClass.prop12, 12)
    assert(TestClass.a, -1)
    checker()
}
