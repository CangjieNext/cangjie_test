/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    assert(E.g1<Int64, Bool>(), 1)
    assert(E.g2<Int64, Bool>(1, true), 1)
    assert(f(), 1)
}
