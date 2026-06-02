// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

foreign func printf(fmt: CString, ...): Int32
foreign func PassPointerToCangjie(): CPointer<Int32>

open class A {
    var a: CPointer<Int32> = unsafe { PassPointerToCangjie() }
}

class B <: A {
    var b: CPointer<Float32>
    init() {
        super()
        b = CPointer<Float32>(a)
    }
}