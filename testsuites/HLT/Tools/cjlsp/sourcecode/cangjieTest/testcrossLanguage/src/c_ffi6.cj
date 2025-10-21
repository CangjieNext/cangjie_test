/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
foreign func testfunc64(ptr: CPointer<Int64>): Int64

func test6():Int64 {
    var a = 1
    unsafe {
        return testfunc64(inout a)
    }
}
