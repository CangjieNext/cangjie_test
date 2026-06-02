/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

unsafe main() {
    let tc = TestClass()
    assert(tc.f1() is Father, true)
    assert(tc.f3(Father(), Son()) is Father, true)
    assert(tc.f5() is Father, true)
    assert(tc.g1() is Son, true)
    assert(tc.g3(Father(), Son()) is Son, true)
    assert(tc.g5() is Son, true)
    
    let b = B()
    assert(b.f1() is Father, true)
    assert(b.f3(Father(), Son()) is Father, true)
    assert(b.f5() is Father, true)
    assert(b.g1() is Son, true)
    assert(b.g3(Father(), Son()) is Son, true)
    assert(b.g5() is Son, true)
    checker(tc, b)
}


