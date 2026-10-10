// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

foreign func rand(): Int32

@C
func foo(): Unit {
    println("foo")
}

var foo1: CFunc<() -> Unit> = {
    => println("foo1")
}

main(): Int64 {
    unsafe {}
    unsafe {
        rand() // Call foreign func.
        foo() // Call @C func.
        foo1() // Call CFunc var.
    }
    0
}
