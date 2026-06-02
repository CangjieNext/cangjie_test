/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

extend Int8 {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
        return a1
    }
}

extend String {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
        return a1
    }
    func printIntAndArg<T, V>(a: T, b: V) where T <: ToString, V <: ToString {
        var a1 = a
        var a2 = b
        println("${a}" + "${b}")
        return a2
    }
}

main() {
    var a: Int8 = 1
    var a2 = "aaa"
    var b = a.printIntAndArg(6)
    var b2 = a2.printIntAndArg(6)
    var b3 = a2.printIntAndArg(1, 2)
    0
}
