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

struct Data<ab> {
    public let count: ab

    public Data(x: ab) {
        count = x
    }
}

func run(): Int64 {
    var i: Int64 = 4
    let data: Data<Int64> = Data<Int64>(i)
    var res: Int64 = data.count
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
