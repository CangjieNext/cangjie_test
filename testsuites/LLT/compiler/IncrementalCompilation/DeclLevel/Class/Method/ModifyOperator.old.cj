class A {
    init(a:Int64){
        x = a
    }
    public var x:Int64 = 1
    
    public operator func +(a : A){
        return A(x + a.x)
    }
}

main(): Int64 {
    let a = A(1)

    return (a + A(2)).x
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
