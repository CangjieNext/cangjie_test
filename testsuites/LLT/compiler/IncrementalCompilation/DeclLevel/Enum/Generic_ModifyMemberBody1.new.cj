enum A<T> {
    | a | b
    func foo(){
        return 1
    }
}

let z = A<Int64>.a

func fuzz(){
    let a:A<Int64>
}

main(): Int64 {
    let e = A<Int64>.a
    return e.foo()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
