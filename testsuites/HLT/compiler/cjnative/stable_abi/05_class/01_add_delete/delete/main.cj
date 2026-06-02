/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

main() {
    let f1 = Father1(5)
    assert(f1.v1, 0)
    assert(f1.v2, 1)
    assert(f1.v3, 5)
    assert(f1.foo1(9), 10)
    assert(Father1.foo2(90), 100)

    let g1 = Generics1<Int64>(101)
    assert(g1._v1, 0)
    assert(g1._v2, 1)
    assert(g1._v3, 101)
    assert(g1.goo1(1), 10)
    assert(Generics1<UInt64>.goo2(10), 100)
    assert(g1.goo3(123), 123)
}
