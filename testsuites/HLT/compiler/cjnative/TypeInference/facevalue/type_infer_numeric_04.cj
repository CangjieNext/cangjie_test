/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Data1 {
    public var data: Int8
    public init(x: Int8) {
        data = x
    }
}

class Data2 {
    public var data: Int64
    public init(x: Int64) {
        data = x
    }
}

class Data3 {
    public var data: Float32
    public init(x: Float32) {
        data = x
    }
}

class Data4 {
    public var data: Float64
    public init(x: Float64) {
        data = x
    }
}

main(): Int64 {
    var num1: Int8 = 2
    var num2: Float32 = 2.0
    var num3: Float32 = 2.0
    var num4 = 2 // 2 is inferred to be Int64
    var num5 = 2.0 // 2.0 is inferred to be Float64

    var res1 = Data1(num1).data
    var res2 = Data1(3).data // 3 is inferred to be Int8

    var res3 = Data2(num4).data
    var res4 = Data2(3).data // 3 is inferred to be Int64

    var res5 = Data3(3.0).data // 3.0 is inferred to be Float32
    var res6 = Data3(num2).data
    var res7 = Data3(num3).data

    var res8 = Data4(num5).data
    var res9 = Data4(3.0).data // 3.0 is inferred to be Float64

    if (res1 + res2 == 5 && res3 + res4 == 5 && res5 + res6 + res7 == 7.0 && res8 + res9 == 5.0) {
        return 0
    }
    return 1
}
