/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

main() {
    let c = CC()
    assert(c.a1, 1)
    assert(c.a2, 2)
    c.a2 = 22
    assert(c.a2, 22)
    c.a2 = 2
    assert(c.a2, 2)
    assert(c.f1, 1)
    assert(c.f2, 2)
    c.f2 = 22
    assert(c.f2, 22)
    c.f2 = 2
    assert(c.f2, 2)
    assert(c.g1, 1)
    assert(c.h2(), 1)
    checker()
}
