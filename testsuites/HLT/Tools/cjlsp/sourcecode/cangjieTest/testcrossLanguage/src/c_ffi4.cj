/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

foreign func testfuncstatement(a: Float32, b: Float32): Float32

//c中只有函数声明
func test4(): Int64 {
    unsafe {
        if (testfuncstatement(1.33333, 1.33333) < 1.77777 && testfuncstatement(1.33333, 1.33333) > 1.77776) {
            return 0
        }
    }
    return 1
}
