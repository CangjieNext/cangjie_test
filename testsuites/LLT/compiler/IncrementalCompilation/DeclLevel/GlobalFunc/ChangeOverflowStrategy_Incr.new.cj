class A {
    @OverflowSaturating
    A(let a: Int64, var b: Int64) {
        println(a+b)
    }
    
    ~init() {
        println(a-b)
    }
}
@OverflowWrapping
func foo(a: Int64, b: Int64): Int64 {
    return a*b+a-b
}
@OverflowThrowing
main(): Int64 {
    let a = A(0x7fffffffffffffff, 0x30004bea58267791)
    return a.a*a.b
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
