/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (JS) EXEC: cp -r %stdpath .
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*
//泛型函数中对类型变元的使用是ArrayList<T>
func aoo<T>(x: ArrayList<T>): ArrayList<T> {
    var a = x
    return a
}

class Data<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

func x(a: Int64): Int32 {
    1
}

func test_function_call() {
    var b = aoo<Int32>(ArrayList<Int32>(10, x))
    var e = aoo(ArrayList<Int32>(10, x))
    Data<ArrayList<Int32>>(b)
    Data<ArrayList<Int32>>(e)
    //    Data(b) // 此处B103无法推断
    //    Data(e) // 此处B103无法推断
}

func run(): Int64 {
    test_function_call()
    return 0
}

main(): Int64 {
    return run()
}
