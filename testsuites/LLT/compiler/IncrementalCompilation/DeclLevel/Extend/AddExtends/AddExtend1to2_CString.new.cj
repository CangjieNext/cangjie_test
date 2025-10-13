extend CString {
    func foo(a: Int32): Int64 { this.size() + Int64(a) }
}

main() {
    unsafe {
        let a = LibC.mallocCString("barbarbar")
        let res = a.foo(-8)
        LibC.free(a)
        return res 
    }
}

extend CString {
    func foo(a: Int64): Int64 { this.size() + a + 1 }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
