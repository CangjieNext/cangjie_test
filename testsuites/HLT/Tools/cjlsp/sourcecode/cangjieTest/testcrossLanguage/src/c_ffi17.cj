/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
//不同文件中有同样的函数定义
foreign func testsame(ptr: CPointer<Int64>): CPointer<Int64>

func test17() {
    var ptr = unsafe { LibC.malloc<Int64>(count: 10) }
    try (r = ptr.asResource()) {
        var pt = unsafe { testsame(r.value) }
        if (unsafe { pt.read() } == 5) {
            return 0
        }
    }
    return 1
}
