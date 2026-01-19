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
    assert((CC.a1 as Int64).getOrThrow(), 1)
    assert((CC.a2 as Int64).getOrThrow(), 2)
    assert((CC.a3 as Int64).getOrThrow(), 3)
    assert(CC.c1 is Father, true)
    assert(CC.c2 is Son, true)
    assert(CC.f3() is Father, true)
    assert(CC.f4() is Son, true)
    assert(CC.f5() is Father, true)
    assert(CC.f6() is Son, true)

    let b = B()
    assert((B.a1 as Int64).getOrThrow(), 1)
    assert((B.a2 as Int64).getOrThrow(), 2)
    assert((B.a3 as Int64).getOrThrow(), 3)
    assert(B.c1 is Father, true)
    assert(B.c2 is Son, true)
    assert(B.f3() is Father, true)
    assert(B.f4() is Son, true)
    assert(B.f5() is Father, true)
    assert(B.f6() is Son, true)

    checker()
}
