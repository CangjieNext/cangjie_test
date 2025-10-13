/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

unsafe main() {
    var ts = TestStruct()

    if (ts.f1() == 1 && ts.f4() == 3
        && ts.f6() == 5 && ts.f8() == 8
        && ts.f14() == 13 && ts.f16() == 5) {
        return 0
    } else {
        return 1
    }
}
