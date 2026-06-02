public enum A {
    a|b 
    |c(Int64)|d(Float32)
}

let z = A.a

func foo(){
    let a:A
}

main(): Int64 {
    return match(A.a) {
        case b => 1
        case _ => 0
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
