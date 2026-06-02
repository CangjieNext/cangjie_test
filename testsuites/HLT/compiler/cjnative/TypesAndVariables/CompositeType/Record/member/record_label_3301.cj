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

main(): Int64 {
    return run()
}

struct Data {
    public var v1: Int32 = 1
    public var v2: Int32 = v1
    public init(x: Int32, y: Int32) {
    }
    public func area(): Int32 {
        var res: Int32 = 3
        return res
    }
}

func run(): Int64 {
    var a: Int32 = 5
    var b: Int32 = 6
    let data: Data = Data(a, b)
    var res: Int32 = data.area()
    if (res == 3) {
        return 0
    }
    return 1
}
