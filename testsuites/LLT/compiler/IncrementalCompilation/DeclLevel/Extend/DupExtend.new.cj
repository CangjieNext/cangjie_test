interface I {}

class A {}

extend A <: I {}
extend A {
    func foo(): Int32 { Int32(9) }
    func nut() {
        foo()
    }
}

extend Int32 <: I {
    func bar(): Int32 { this + Int32(1) }
    func baruse() {
        bar()
    }
}

main() {}

extend Int32 {
    func bar(): Int64 { 2 }
}

extend A {
    func foo(): I { 
        let a: I = Int32(7)
        a
    }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
