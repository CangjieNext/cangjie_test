/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

main(): Int64 {
    let g1 = Generics<Father, Son>(101)
    if (g1._v1 == 0 && g1._v2 == 1 && g1._v3 == 101
        && g1.goo1(1) == 10 && Generics<Father, Son>.goo2(10) == 100 && (g1.goo3(Father(), Son()) is (Father, Son))) {
    } else {
        return 1
    }
    g1._v2 = 202
    if (g1._v1 == 202) {
    } else {
        return 1
    }
    checker()
}
