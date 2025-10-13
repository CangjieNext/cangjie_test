/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

main() {
    TestClass.prop11 = -1

    if (TestClass.prop1 == 1 && TestClass._prop3 == 3
        && TestClass.prop4 == 4 && TestClass.prop6 == 6
        && TestClass.prop10 == 10 && TestClass.prop11 == 11
        && TestClass.prop12 == 12 && TestClass.a == -1) {
        return 0
    } else {
        return 1
    }
}
