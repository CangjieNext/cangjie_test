var ctv: Int64 = 0
func ctr(): Int64 {
    ctv++
    return ctv
}


let b = ctr()


class A<T>{
    static var x:Int64 = ctr()
}

main(): Int64 {

    println(b)
    
    println(A<Float32>.x)

    println(A<Int64>.x)

    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
