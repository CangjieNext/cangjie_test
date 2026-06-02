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
    public let a: Int32
    public let b: Int32
    public init(x: Int32, y: Int32, z: Int32) {
        a = x + 1
        b = y + 1
    }
}

let res = Test(10, 20, 60)

func run(): Int64 {
    let width = res.a
    let length = res.b
    if (width == 11 && length == 21) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
