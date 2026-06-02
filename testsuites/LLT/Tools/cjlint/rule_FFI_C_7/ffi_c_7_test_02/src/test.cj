// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

foreign func printf(fmt: CString, ...): Int32
foreign func PassPointerToCangjie(): CPointer<Int32>

main() {
    var a: CPointer<Int32> = unsafe { PassPointerToCangjie() }
    // 删除此处的强制类型转换
    if (a.isNull()) {
        print("pointer is null!\n")
        return
    }
    if (unsafe { a.read() != 0 }) {
        print("Pointer a was cut!\n")
        var value = unsafe { LibC.mallocCString("%x\n") }
        unsafe { printf(value, a.read(0)) }
        unsafe { LibC.free(value) }
        return
    }
    var value = unsafe { LibC.mallocCString("%x\n") }
    unsafe { printf(value, a.read(0)) }
    unsafe { LibC.free(value) }
}