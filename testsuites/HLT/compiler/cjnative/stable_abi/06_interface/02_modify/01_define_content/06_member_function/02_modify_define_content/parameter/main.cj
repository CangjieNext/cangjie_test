/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    assert(I.g01(), 1)
    assert(I.g02(1, 1), 1)
    assert(I.g03(a: 1, b: 1), 1)
    assert(I.g04(S1()), 1)
    assert(C().g11(), 1)
    assert(C().g12(1, 1), 1)
    assert(C().g13(a: 1, b: 1), 1)
    assert(C().g14(S1()), 1)
}
