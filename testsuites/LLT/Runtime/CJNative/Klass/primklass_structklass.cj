// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Test {
    public var t0: Int32 = 0
}

struct Rcd {
    public var a0: Int64 = 0
    public var a1: Int32 = 2
    public var a3: Test = Test()
    public var a4: Test = Test()
}

func T1(): Int64 {
    var a1: Array<Bool> = [true, false]
    var a2: Array<Int8> = [1, 2]
    var a3: Array<Int16> = [1, 2]
    var a4: Array<Int32> = [1, 2]
    var a5: Array<Int64> = [1, 2]
    var a6: Array<UInt8> = [1, 2]
    var a7: Array<UInt16> = [1, 2]
    var a8: Array<UInt32> = [1, 2]
    var a9: Array<UInt64> = [1, 2]

    var f1: Array<Float16> = [3.14, 3.15]
    var f2: Array<Float32> = [3.14, 3.15]
    var f3: Array<Float64> = [3.14, 3.15]

    var array2 = [[1, 2], [3, 4]]
    var array3 = [Test()]
    var array4 = [Rcd()]
    return 1
}

main(): Int64 {
    var a1: Array<Bool> = [true, false]
    var a2: Array<Int8> = [1, 2]
    var a3: Array<Int16> = [1, 2]
    var a4: Array<Int32> = [1, 2]
    var a5: Array<Int64> = [1, 2]
    var a6: Array<UInt8> = [1, 2]
    var a7: Array<UInt16> = [1, 2]
    var a8: Array<UInt32> = [1, 2]
    var a9: Array<UInt64> = [1, 2]

    var f1: Array<Float16> = [3.14, 3.15]
    var f2: Array<Float32> = [3.14, 3.15]
    var f3: Array<Float64> = [3.14, 3.15]

    var array2 = [[1, 2], [3, 4]]
    var array3 = [Test()]
    var array4 = [Rcd()]
    if (a5[1] == 2) {
        return 0
    }
    return 1
}
