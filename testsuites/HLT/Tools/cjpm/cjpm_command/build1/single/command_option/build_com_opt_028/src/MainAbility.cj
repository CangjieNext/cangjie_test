/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package demo

foreign func testfunc(): CPointer<UInt16>

unsafe main(): Int64 {
    var ptr: CPointer<UInt16> = testfunc()
    var ptrtmp: CPointer<UInt16> = ptr + 1
    var count = 0

    if ((ptr.read(0) == 0) && (ptr.read(1) == 2) && (ptr.read(2) == 65535)) {
        count += 1
    }

    if ((ptrtmp.read(-1) == 0) && (ptrtmp.read() == 2) && ((ptrtmp + 1).read() == 65535)) {
        count += 1
    }

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
