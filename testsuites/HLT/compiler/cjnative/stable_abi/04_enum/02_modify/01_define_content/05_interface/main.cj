/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    f()
    assert(E1.Red.g(), 1)
    assert(E1.Red.f1(), 11)
    assert(E1.Red.f2(), 2)
    assert(E2.Red.g(), 1)
    assert(E2.Red.f1(), 1)
    assert(C1().v, 1)
    assert(f1(), 1)
}
