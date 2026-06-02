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
    var width: Float64 = 6.54321
    let data: Data<Float64> = Data<Float64>(width)
    var res = data.width
    if (res == width) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
