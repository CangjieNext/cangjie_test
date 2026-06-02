/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

main() {
    let f1 = Father(5)
    let g1 = Generics<Int64>(101)
    assert(f1.v1, 0)
    assert(f1.v2, 1)
    assert(f1.v3, 5)
    assert(f1.foo1(9), 10)
    assert(Father.foo2(90), 100)
    assert(g1._v1, 0)
    assert(g1._v2, 1)
    assert(g1._v3, 101)
    assert(g1.goo1(1), 10)
    assert(Generics<Int64>.goo2(10), 100)
    assert(g1.goo3(123), 123)
    check(f1, g1, 123)
}
