/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

main(): Unit {
    let c0 = CC()
    assert(CC.a1, 1)
    assert(CC.a2, 2)
    CC.a2 = 22
    assert(CC.a2, 22)
    CC.a2 = 2
    assert(CC.a2, 2)
    assert(CC.a3, 3)

    assert(CC.a4, 1)
    assert(CC.a5, 2)
    CC.a5 = 22
    assert(CC.a5, 22)
    CC.a5 = 2
    assert(CC.a5, 2)
    
    assert(CC.a6, 3)

    assert(CC.b1, 1)
    assert(CC.b2, 2)
    CC.b2 = 22
    assert(CC.b2, 22)
    CC.b2 = 2
    assert(CC.b2, 2)
    assert(CC.b3, 3)

    assert(CC.c1 is Son, true)
    assert(CC.d2, 1)
    assert(CC.e3(), 1)
    assert(c0.e4(), 2)

    checker()
}
