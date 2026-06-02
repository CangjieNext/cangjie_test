/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

//泛型函数中对类型变元的使用是T，调用时构造不匹配的场景
func aoo2<T>(x: T): T {
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
    var b = aoo2<Int32>(1) // 此处的1是int32
    Data<Int32>(b)
    var e = aoo2(1) // 此处的1是int64
    Data<Int64>(b)
    Data<Int32>(e)
}

func run(): Int64 {
    test_function_call()
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_mismatched_types
