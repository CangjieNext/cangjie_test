open class Base{
    public let a:Int64 = 0
}

open class Derive1 <: Base{
}

class Derive2 <: Derive1{
    public let a:Int64 = 0
    public let b:Int64 = 10
}

func useB(){
    let d2 = Derive2()
    d2.b
}

main() {
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
