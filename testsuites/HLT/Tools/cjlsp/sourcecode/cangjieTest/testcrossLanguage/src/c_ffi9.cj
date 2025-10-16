/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
foreign func testcstring(ptr: CString): CString

func test9() {
    unsafe {
        var str = LibC.mallocCString("test")
        if (testcstring(str).toString() == "test") {
            unsafe { LibC.free(str) }
            return 0
        }
        return 1
    }
}
