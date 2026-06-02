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

struct Test {
    public let a1: Int32
    public let b1: Int32

    public init(a: Int32) {
        a1 = a
        b1 = 2
    }
    public Test(a: Int32, b: Int32) {
        a1 = a
        b1 = b
    }
    public func perimeter(): Int32 {
        return (a1 + b1) * 2
    }
    public func area(): Int32 {
        return a1 * b1
    }
}

let test1 = Test(2)
let res1 = test1.perimeter()
let res2 = test1.area()
let test2 = Test(2, 3)
let res3 = test2.perimeter()
let res4 = test2.area()

func run(): Int64 {
    if (res1 == 8 && res2 == 4 && res3 == 10 && res4 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
