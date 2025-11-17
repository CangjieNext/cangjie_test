/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    assert(TestClass().prop1, 1)
    assert(TestClass().n1(), 1)
    assert(TestClass().prop_1, 1)
    assert(TestClass().n_1(), 1)
    check()
    if (
        TestClass().prop1 == 1 && TestClass().prop_1 == 1
    ) {
        return 0
    }
    return 1
}

