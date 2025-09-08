interface Base1{
    func returnVal(){
        return 0
    }
}

interface Base2{
    func returnVal(){
        return 1
    }
}

open class Derive1{
}

extend Derive1 <: Base2{

}

main() {
    let d:Derive1 = Derive1()
    return d.returnVal()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
