main() {
    unsafe {
        let a = LibC.mallocCString("valuevalue")
        let b = a.size() + a.foo()
        LibC.free(a)
        return b 
    }
}

extend CString {
    func foo(): Int64 {1}
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
