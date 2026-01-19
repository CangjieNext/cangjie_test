/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

main() {
    assert(Public_C().v1, 1)
    assert(Public_C(2).v1, 2)
    assert(Protected_C().v1, 1)
    assert(Internal_C().v1, 1)
    assert(Private_C().v1, 1)
    assert(Frozen_C(1).v1, 1)
    assert(Const_C(1).v1, 1)
    assert(Generics_C1<Int64, Int64, Son>(1, b: 1, c: Son()) is Generics_C1<Int64, Int64, Son>, true)
    assert(Generics_C2<Int64, String, Father>(1, "", Father()) is Generics_C2<Int64, String, Father>, true)
    assert(Param_C1(1, b: 1) is Param_C1, true)
    assert(Param_C2(Son(), b: Son()) is Param_C2, true)
    assert(Param_C3(Father(), b: Father()) is Param_C3, true)
    checker()
}
