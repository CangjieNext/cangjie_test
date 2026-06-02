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
    public let b: Int32
    public let a: Int32 = 1
    public Test() {
        b = 4
    }
}

let res = Test()
let res1 = res.a
let res2 = res.b

func run(): Int64 {
    if (res1 == 1 && res2 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
