/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct Rcd {
    public var a0: Int64 = 0
    public var a1: Int32 = 2
    public var f0: Float32 = 3.15
}

class Cls {
    public var a0: Int64 = 0
    public var a1: Int32 = 2
    public var a2: Array<Int8> = [1, 2]
    public var a3: Array<Int16> = [3, 4]
    public var a4: Array<Int32> = [5, 6]
    public var a5: Array<Int64> = [7, 8]
    public var f0: Array<Float32> = [3.14, 3.15]
    public var d0: Array<Float64> = [3.1456, 3.1567]
    public var array1:Array<Array<Int64>> = [[1, 2], [3, 4]]
    public var array2:Array<Rcd> = [Rcd()]
}

main(): Int64 {
    var temp = Cls()
    if (temp.array1[0][1] == 2) {
        return 0
    }
    return 1
}
