/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

//泛型函数中对类型变元的使用是数组T[]
func aoo2<T>(x: Array<T>): Array<T> {
    var a = x
    return a
}

class Data<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

func test_function_call() {
    var a0: Int32 = 1
    [a0, a0]
    var d = aoo2<Int32>([a0, a0])
    Data<Array<Int32>>(d)
    var f = aoo2([a0, a0])
    Data<Array<Int32>>(f)
    //    Data(b) // 此处B103无法推断
    //    Data(d) // 此处B103无法推断
}

func run(): Int64 {
    test_function_call()
    return 0
}

main(): Int64 {
    return run()
}
