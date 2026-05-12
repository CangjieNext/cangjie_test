/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    assert(Red.getWidth(), 11)
    assert(Red.geta("test", b: -1), 0)
    assert(Red.geta2(), 1)
    assert(Red.geta3(0, b: 0), 1)
    assert(Red.geta5(), 1)
    assert(Red.geta6(0, 0.0), 1)
    assert(Red.geta8(), 1)
    assert(Red.geta9(A(), B()), 1)
    assert(Red.geta10(0, 0.0), 1)
    assert(Red.geta11(0, 0.0), 1)
    check()
}
