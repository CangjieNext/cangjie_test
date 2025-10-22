/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
foreign func test_same(ptr: CPointer<Int64>,ptr2: CPointer<Int64>): Int64

class AB {
    var a = 1
    var b = 9
}

func test31():Int64 {
    var a = AB().a
    var b = AB().b
    unsafe {
        return test_same(inout a,inout b)
    }
}
