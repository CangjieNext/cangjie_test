func foo(a:Int64): Int64 {
    return 0
}

func useFoo(){
    let a = 100
    return foo(a)
}

main(): Int64 {
    return useFoo()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
