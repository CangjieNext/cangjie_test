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

struct Data {
    public var a: Int32 = 1
    public var b: Int32 = a
    public init(x: Int32, y: Int32) {
    }
}

func run(): Int64 {
    var a: Int32 = 5
    var b: Int32 = 6
    let data = Data(a, b)
    var res1 = data.a
    var res2 = data.b
    if (res1 == res2 && res1 == 1) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
