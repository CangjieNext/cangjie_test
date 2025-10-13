open class Base1{
    public let a:Int64 = 0
}

open class Base2{
    public let a:Int64 = 10
}

open class Derive1 <: Base2{
    public let b:Int64 = 1
}

class Derive2 <: Derive1{
    public let c:Int64 = 2
}

func useB(){
    let b = Derive1()
    return b.a + b.b
}

func useC(){
    let c = Derive2()
    return c.a + c.c
}

main() {
    return useB() + useC()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
