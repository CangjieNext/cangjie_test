/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type str = String

type UInt = UInt32

type float = Float64

interface IF<T> {
    func test(a: T): T {
        return a
    }
}

class Test<T> <: IF<T> {}

main(): Int64 {
    var test1: Test<str> = Test<str>()
    let value1: str = test1.test("hello")
    var test2: Test<UInt> = Test<UInt>()
    let v: UInt = 0
    let value2: UInt = test2.test(v)
    var test3: Test<float> = Test<float>()
    let value3: float = test3.test(3.1415)
    print(value2.toString())
    if (value1 == "hello" && value2 == 0 && (value3.toString() == "3.141500" || value3.toString() == "3.1415")) {
        return 0
    }
    return 1
}
