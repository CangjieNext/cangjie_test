/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

main() {
    try {
        let c = CC()
        assert(c.a1, 10)
        assert(c.a2, 20)
        c.a2 = 22
        assert(c.a2, 22)
        c.a2 = 20
        assert(c.a2, 20)
        assert(c.f1, 10)
        assert(c.f2, 20)
        c.f2 = 22
        assert(c.f2, 22)
        c.f2 = 20
        assert(c.f2, 20)
        assert(c.g1, 10)
        assert(c.h2(), 10)
        checker()
        0
    } catch (e: Exception) {
        3
    }
}
