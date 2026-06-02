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

class Test<T> {
    public var t1: T
    public init(t: T) {
        this.t1 = t
    }
    public func test(a: T): T {
        t1 = a
        return t1
    }
}

main(): Int64 {
    var test1: Test<str> = Test<str>("")
    let value1: str = test1.test("hello")
    var test2: Test<UInt> = Test<UInt>(0)
    let value2: UInt = test2.test(0)
    var test3: Test<float> = Test<float>(0.0)
    let value3: float = test3.test(3.1415)
    let value4: str = value1 + "->" + value2.toString() + "->" + value3.toString()
    if (value4 == "hello->0->3.141500" || value4 == "hello->0->3.1415") {
        return 0
    }
    return 1
}
