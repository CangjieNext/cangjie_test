interface I1 {
    func f(): Int64 { 1 }
}
extend CString <: I1 {}

main() {
    unsafe {
        let a = LibC.mallocCString("haha")
        let value = a.f()
        LibC.free(a)
        return value
    }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
