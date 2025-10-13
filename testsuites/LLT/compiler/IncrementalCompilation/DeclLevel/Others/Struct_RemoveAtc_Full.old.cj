@C
struct A {
    let a: Int64 = 3
}
func foo(a: A): Int64 { a.a-1 }
main(): Int64 {
    unsafe {
        foo(A())
    }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
