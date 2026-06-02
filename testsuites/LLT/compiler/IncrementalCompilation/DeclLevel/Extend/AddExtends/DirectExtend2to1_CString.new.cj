extend CString {
    public func foo(a: Int32): Int64 {1}
}
// extend CString {
//     public func foo(a: Int64): Int64 {2}
// }

main() {
    unsafe {
        let a = LibC.mallocCString("dkfsa")
        let b = a.foo(7)
        LibC.free(a)
        b
    }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
