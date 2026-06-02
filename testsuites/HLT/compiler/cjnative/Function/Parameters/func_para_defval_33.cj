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

func run(): Int64 {
    var res = Foo()
    if (res == 11) {
        return 0
    }
    return 1
}

struct Data {
    public var a: Int64 = 1
    public var b: Int64 = 2
    public init(x: Int64, y: Int64) {
        a = x
        b = y
    }
    public func foo(): Int64 {
        return a + b
    }
}

func Foo(a!: Data = Data(5, 6)): Int64 {
    return a.foo()
}
