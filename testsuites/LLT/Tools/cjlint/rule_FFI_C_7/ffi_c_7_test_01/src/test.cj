// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

foreign func printf(fmt: CString, ...): Int32
foreign func PassPointerToCangjie(): CPointer<Int32>

main() {
    var a: CPointer<Int32> = unsafe { PassPointerToCangjie() }
    var b: CPointer<Int16> = CPointer<Int16>(a) // 此处将 Int32 类型指针强制转换成 Int16 型
    if (b.isNull()) {
        print("pointer is null!\n")
        return
    }
    if (unsafe { b.read() != 0 }) {
        print("Pointer was cut!\n")
        var value = unsafe { LibC.mallocCString("%x\n") }
        unsafe { printf(value, b.read(1)) } // read(1) 访问 Int16 的高两位数据，可能造成越界访问
        unsafe { LibC.free(value) }
        return
    }
    var value = unsafe { LibC.mallocCString("%x\n") }
    unsafe { printf(value, b.read(0)) }
    unsafe { LibC.free(value) }
}