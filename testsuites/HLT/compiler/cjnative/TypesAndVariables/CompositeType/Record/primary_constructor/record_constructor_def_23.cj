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

main(): Int64 {
    return run()
}

struct Test<T> {
    public let width2: T
    public let length2: T

    public Test(width: T, length: T) {
        width2 = width
        length2 = length
    }

    public func area(): T {
        return width2
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data: Test<Int32> = Test<Int32>(a, b)
    var res: Int32
    res = data.area()
    if (res == 3) {
        return 0
    }
    return 1
}
