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

struct Data<T> {
    public let width: T
    public let length: T

    public init(x: T, y: T) {
        width = x
        length = y
    }

    public operator func -(): Data<Int32> {
        var width: Int32 = 3
        var length: Int32 = 4
        Data<Int32>(width, length)
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    var data: Data<Int32> = Data<Int32>(a, b)
    var d1: Data<Int32> = -data
    var res1: Int32 = d1.width
    var res2: Int32 = d1.length
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}
