/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    assert(I1.p1, 1)
    assert(C1().p2, 1)
    assert(I2.p1, 1)
    assert(C2().p2, 1)
    assert(I3.p1, 1)
    assert(C3().p2, 1)
    assert(I4.p1, 1)
    assert(C4().p2, 1)
}
