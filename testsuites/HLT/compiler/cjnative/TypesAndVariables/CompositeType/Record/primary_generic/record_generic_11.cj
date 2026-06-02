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
    public let width: T1
    public let length: T2
    public Data(x: T1, y: T2) {
        width = x
        length = y
    }
    public func area(height: T3): T3 {
        return height
    }
}

func run(): Int64 {
    var width: Int64 = 1
    var length: Float64 = 2.2
    var data: Data<Int64, Float64, Int32> = Data<Int64, Float64, Int32>(width, length)
    var res1: Int64 = data.width
    var res2: Float64 = data.length
    var height: Int32 = 2
    var res3: Int32 = data.area(height)

    if (res1 == 1 && res2 == 2.2 && res3 == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
