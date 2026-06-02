public enum A {
    |a|b 
    prop foo:Int64 {
        get(){
            return 0
        }
    }
    prop fuzz:Int64 {
        get(){
            return 2
        }
    }
}

let z = A.a

func foo(){
    let a:A
}

main(): Int64 {
    let e = A.a
    return e.foo
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
