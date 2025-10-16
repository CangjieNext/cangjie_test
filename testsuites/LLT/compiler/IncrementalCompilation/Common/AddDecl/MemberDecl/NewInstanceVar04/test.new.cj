class A {
    var a = 1
}

struct S {
    var v: Int64 = 1
    var x = A()
}

main() : Int64 {
    let a = A()
    let b = S()
    return b.v + b.x.a
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
