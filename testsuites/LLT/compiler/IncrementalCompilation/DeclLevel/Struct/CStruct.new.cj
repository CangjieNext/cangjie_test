@C struct A {
    
}

@C struct B {
    let a: Int64 = 1
}

@C struct C {
    let q: Int64 = -2
    var d: Int32 = 15
}

@C struct D {
    var a: Int64 = 9
    let m = -3
}

func u1(): Int64 {
    B().a 
}

func u2(): Int64 {
    Int64(C().d) - D().a 
}

main() {
    u1()+u2()-7
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
