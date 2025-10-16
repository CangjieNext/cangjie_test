class A {
    var a : Int32 = 1
    init() {}
}
 
func foo(a!: A = A(), b!: Int32 = 1) { a.a }
 
main() : Unit {
    foo()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
