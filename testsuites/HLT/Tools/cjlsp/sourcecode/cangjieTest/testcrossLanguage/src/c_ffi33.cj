/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
//.h中声明和定义，.c中导入.h

foreign func test_h3(ptr: CPointer<Int64>): Int64

class AC {
    static var a = 1

    func test_h() {
        unsafe {
            return test_h3(inout a)
        }
    }
}
