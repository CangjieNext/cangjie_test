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
    public let width: T

    public init(x: T) {
        width = x
    }
}

func run(): Int64 {
    let array: Array<Array<Int32>> = [[1, 2], [3, 4], [5, 6]]
    let data: Data<Array<Array<Int32>>> = Data<Array<Array<Int32>>>(array)
    var res: Array<Array<Int32>> = data.width
    if (res[2][1] == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
