open class Base{

}

open class Derive1 <: Base{

}

class Derive2 <: Derive1{

}

main() {
    let d2 = Derive2()
    if(d2 is Derive1){
        return 1
    }
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
