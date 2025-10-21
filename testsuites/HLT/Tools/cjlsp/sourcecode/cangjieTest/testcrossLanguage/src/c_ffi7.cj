/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
foreign func testfuncvoid(): Unit

func test7(): Int64 {
    var countu = 0
    unsafe {
        if (testfuncvoid() == ()) {
            countu += 1
        }
    }
    if (countu == 1) {
        return 0
    } else {
        return 1
    }
}
