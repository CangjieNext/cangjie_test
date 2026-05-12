/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    assert(I.g1<S2, S1, Int64>(S2(), S1()), 3)
    assert(C().g2<S2, S1, Int64>(S2(), S1()), 3)
}
