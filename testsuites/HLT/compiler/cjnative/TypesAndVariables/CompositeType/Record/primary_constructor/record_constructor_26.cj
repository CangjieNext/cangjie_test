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
    public var a: Int32 = 0
    public var b: Int32 = 0
    public Test(a: Int32, b: Int32) {
        this.a = a
        this.b = b
    }
    public init(x: Int32) {
        b = x
    }
}

let res = Test(5, 6)
let res1 = res.a
let res2 = res.b

func run(): Int64 {
    if (res1 == 5 && res2 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
