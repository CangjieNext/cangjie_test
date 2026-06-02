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
    public var a: Int32 = 1
    public var b: Int32 = 2
    public Test(x: Int32, y: Int32, z: Int32) {
        a = x
        b = y + z
    }
}

let res = Test(5, 6, 7)
let res1 = res.a
let res2 = res.b

func run(): Int64 {
    if (res1 == 5 && res2 == 13) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
