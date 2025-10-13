open class Base{
    public let a:Int64 = 0
}

open class Derive1 <: Base{
    public let b:Int64 = 1
}

class Derive2 <: Derive1{
    public let c:Int32 = 2
}

func useA(){
    let a = Base()
    return a.a
}

func useB(){
    let b = Derive1()
    return b.b
}

func useC(){
    let c = Derive2()
    return Int64(c.c)
}

main() {
    return useA() + useB() + useC()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
