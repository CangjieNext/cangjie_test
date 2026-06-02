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
    public Test(var a: Int32, var b: Int32) {}
    public init(x: Int32, y: Float64) {
        a = x + 1
        b = Int32(y + 2.0)
    }
}

var a: Int32 = 5
var b: Int32 = 6
let res = Test(a, b)
var res1 = res.a
var res2 = res.b

func run(): Int64 {
    if (res1 == 5 && res2 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
