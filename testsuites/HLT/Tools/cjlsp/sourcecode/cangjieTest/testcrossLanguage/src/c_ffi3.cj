/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

foreign func testfuncbool(a: Bool, b: Bool): Bool

func test3(): Int64 {
    unsafe {
        if (!testfuncbool(true, false) && testfuncbool(true, true)) {
            return 0
        }
    }
    return 1
}
