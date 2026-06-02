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
    public var a: (Float32, String) = (3.14, "PIE")
    public init() {}
}

let res: Test = Test()
var res1 = res.a

func run(): Int64 {
    if (res1[0] == 3.14 && res1[1] == "PIE") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
