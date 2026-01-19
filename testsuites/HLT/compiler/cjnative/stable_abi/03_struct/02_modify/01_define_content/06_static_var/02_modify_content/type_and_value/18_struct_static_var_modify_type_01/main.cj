/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    let s1 = S1()
    assert(S1.a1 is Addable, true)
    assert(S1.f2() is Addable, true)
    assert(S1.f3() is Addable, true)
    assert(S1.a5 is Addable, true)
    assert(S1.f6() is Addable, true)
    assert(S1.f7() is Addable, true)
    check()
}


