/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

main() {
    let c0 = CC()

    if (CC.a1 == 10 && CC.a2 == 20 && CC.a3 == 3
        && (CC.c1 is Son)
        && CC.d2 == 1 && CC.e3() == 1 && c0.e4() == 20) {
        return 0
    } else {
        return 1
    }
}
