/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Data<T> {
    public let count: T

    public init(x: T) {
        count = x
    }
}

var i: Int32 = 4
let data: Data<Int32> = Data<Int32>(i)
var res: Int32 = data.count

func run(): Int64 {
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
