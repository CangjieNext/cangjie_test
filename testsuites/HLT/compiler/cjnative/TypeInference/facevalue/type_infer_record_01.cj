/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Data(1, 2)
    if (res.a == 1 && res.b == 2) {
        return 0
    }
    return 1
}

struct Data {
    public var a: Int64 = 1
    public var b = 2
    public init(x: Int64, y: Int64) {
        a = x
        b = y
    }
}
