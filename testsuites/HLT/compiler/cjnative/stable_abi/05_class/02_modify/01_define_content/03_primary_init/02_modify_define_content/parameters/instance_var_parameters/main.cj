/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

main() {
    assert(Public_PC().v1 , 1)
    assert(Public_PC(2).v1 , 2)
    assert(Protected_PC().v1 , 1)
    assert(Internal_PC().v1 , 1)
    assert(Private_PC().v1 , 1)
    assert(global2() is Rely_Frozen_PC, true)
    assert(Deprecated_PC1(1).v1 , 1)
    assert(Frozen_PC(1).v1 , 1)
    assert(Const_PC(1).v1 , 1)
    assert(Generics_PC1<Int64, Int64, Son>(1, b: 1, c: Son()) is Generics_PC1<Int64, Int64, Son>, true)
    assert(Generics_PC2<Int64, String, Father>(1, "", Father()) is Generics_PC2<Int64, String, Father>, true)
    assert(Param_PC1(1, b: 1, c: 2, d: 3, e: 4) is Param_PC1, true)
    assert(Param_PC2(1, 1) is Param_PC2, true)
    assert(Param_PC3(1) is Param_PC3, true)
    assert(Param_PC5(Son(), b: Son(), c: Son(), d: Son()) is Param_PC5, true)
    assert(Param_PC6(Father(), b: Father(), c: Father(), d: Father()) is Param_PC6, true)
    checker()
}
