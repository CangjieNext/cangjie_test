/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

main() {
    let a = TestStruct()
    let b = TestE1.XY
    if (a.prop1 == 1 && a.propa == 1
        && b.prop1 == 1 && b._prop3 == 3) {
        return 0
    }
    return 1
}
