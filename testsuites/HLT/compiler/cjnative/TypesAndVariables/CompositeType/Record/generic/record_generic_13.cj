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

func area<V>(height: V): V {
    return height
}

struct Data<T1, T2, T3> {
    public let width: T2
    public let length: T3
    public let area: (Float32) -> Float32
    public init(x: T2, y: T3, z: (Float32) -> Float32) {
        width = x
        length = y
        area = z
    }
}

func run(): Int64 {
    var width: Float64 = 2.2
    var length: Int32 = 2
    var data: Data<Int64, Float64, Int32> = Data<Int64, Float64, Int32>(width, length, area<Float32>)
    var res1: Float64 = data.width
    var res2: Int32 = data.length
    var height: Float32 = 2.3
    var res3: Float32 = data.area(height)
    if (res1 == 2.2 && res2 == 2 && res3 == 2.3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
