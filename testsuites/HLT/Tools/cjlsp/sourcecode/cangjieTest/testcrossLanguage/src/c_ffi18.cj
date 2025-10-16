/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
//c和cpp中有相同函数定义
foreign func testsame2(): Unit

func test18(): Int64 {
    unsafe { testsame2() }
    unsafe {
        var aa = testsame2
    }
    return 0
}


