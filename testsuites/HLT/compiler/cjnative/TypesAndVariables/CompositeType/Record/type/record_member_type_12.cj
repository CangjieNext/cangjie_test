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

func foo(x: Int32): Int32 {
    return x
}

struct Test {
    public var a: (Int32) -> Int32 = foo
    public init() {}
}

func run(): Int64 {
    var i: Int32 = 2
    let res: Int32 = Test().a(i)
    if (res == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
