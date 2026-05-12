/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    assert(I1.g1(), 1)
    assert(C1().g2(), 1)
    assert(I1.g3(), 1)
    assert(C1().g4(), 1)
    assert(C2.g1(), 1)
    assert(C2().g2(), 1)
    assert(C2.g3(), 1)
    assert(C2().g4(), 1)
}
