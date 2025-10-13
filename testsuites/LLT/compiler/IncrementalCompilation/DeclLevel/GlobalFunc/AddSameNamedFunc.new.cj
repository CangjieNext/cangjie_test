func foo(a: Any): Int64 {
    return 1
}

func useFoo1(){
    let a:Int32 = 100
    return foo(a)
}

func useFoo2(){
    let a:Int64 = 100
    return foo(a)
}

main(): Int64 {
    return useFoo1() - useFoo2()
}

func foo(a:Int32): Int64 {
    return 2
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
