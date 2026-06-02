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
    public let length: T
    public init(x: T, y: T) {
        width = x
        length = y
    }
}

func run(): Int64 {
    var i1: Int32 = 3
    var i2: Int32 = 2
    var data: Data<Int32>
    if (true) {
        data = Data<Int32>(i1, i2)
    } else {
        data = Data<Int32>(i2, i1)
    }
    var width: Int32 = data.width
    var length: Int32 = data.length
    if (width == 3 && length == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
