// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {
    let a: Int32
    let b: Int32
    init(x: Int32) {
        a = x
        b = 0
    }
    operator func ()(x: Int32) {        
        x
    }    
}

main():Int64 {
    let obj = A(1)
    let a: Int32 = 1
    let res = a |> obj // Equivalence：obj(a)
    0
}