extend CString {
    func foo(a: Int32) { 2 }
}
unsafe func k() {
    let a = LibC.mallocCString("CJ")
    let b = a.foo(1)
    LibC.free(a)
    b
}
main() {
    unsafe { k() }
}
extend CString {
    func foo(a: Int64) { 1 }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
