func foo(a:Int64) {
    return 1
}

func useFoo(){
    let a = 100
    return foo(a)
}

func foo(a:String) {
    return a
}

func useFoo2(){
    foo("good")
}

main(): Int64 {
    return useFoo()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
