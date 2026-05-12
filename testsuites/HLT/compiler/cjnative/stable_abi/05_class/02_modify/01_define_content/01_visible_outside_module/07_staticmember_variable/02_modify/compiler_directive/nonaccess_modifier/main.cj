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
    assert(CC.c1 is Son, true)
    assert(CC.f1(), 1)
    assert(c0.f2(), 2)
    assert(c0.f3(), 3)
    assert(CC.f4(), 1)
    assert(c0.f5(), 2)
    assert(c0.f6(), 3)
    checker()
}
