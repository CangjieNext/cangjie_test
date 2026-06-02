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

//泛型函数中对类型变元的使用是(T)->T
func aoo<T>(x: (T) -> T): (T) -> T {
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
    var b = aoo<Int32>({x: Int32 => Int32(1)})
    var e = aoo({x: Int32 => Int32(1)})
    Data<(Int32) -> Int32>(b)
    Data<(Int32) -> Int32>(e)
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
