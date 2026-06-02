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

struct Data<T1, T2, T3> {
    public let width: Int32
    public let length: Int32
    public Data(x: Int32, y: Int32) {
        width = x
        length = y
    }
    public func area(height: Int32): Int32 {
        return width * length * height
    }
}

func run(): Int64 {
    var width: Int32 = 1
    var length: Int32 = 2
    var height: Int32 = 3
    var data: Data<Int64, Float64, Int32> = Data<Int64, Float64, Int32>(width, length)
    var res1: Int32 = data.width
    var res2: Int32 = data.length
    var res3: Int32 = data.area(height)
    if (res1 == 1 && res2 == 2 && res3 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
