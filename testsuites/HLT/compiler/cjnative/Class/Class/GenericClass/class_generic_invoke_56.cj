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

func getHeight<V>(height: V): V {
    return height
}

class Data<T> {
    public let width: T

    public init(x: T) {
        width = x
    }
}

func run(): Int64 {
    let data: Data<(Int64) -> Int64> = Data<(Int64) -> Int64>(getHeight<Int64>)
    var res = data.width(4)
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
