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

struct Data<T> {
    public let width: T
    public Data(x: T) {
        width = x
    }
}

func run(): Int64 {
    var list: Array<Int64> = [1, 2, 3, 4]
    let data: Data<Array<Int64>> = Data<Array<Int64>>(list)
    var res = data.width[2]
    if (res == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
