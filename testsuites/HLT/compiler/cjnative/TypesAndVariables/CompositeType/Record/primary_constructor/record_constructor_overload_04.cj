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
    public var tmp1: Int32 = 0
    public var tmp2: Float64 = 0.0
    public init() {}
    public init(x: Int32) {}
    public init(x: Int32, y: Int32) {}
    public Test(x: Int32, y: Float64) {
        tmp1 = x + 2
        tmp2 = y + 2.0
    }
}

var a: Int32 = 5
var b: Float64 = 6.0
let res = Test(a, b)
var res1 = res.tmp1
var res2 = res.tmp2

func run(): Int64 {
    if (res1 == 7 && res2 == 8.0) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
