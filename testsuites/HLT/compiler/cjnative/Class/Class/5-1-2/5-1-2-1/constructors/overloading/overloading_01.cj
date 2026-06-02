/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

class Data {
    public var a: Int32
    public var b: Float32
    public init() {
        a = 200
        b = 300.0
    }

    public init(data1: Int32) {
        a = data1
        b = 300.0
    }

    public init(data1: Int32, data2: Float32) {
        a = data1
        b = data2
    }
}

func run(): Int64 {
    var value1: Data = Data()
    if (value1.a != 200) {
        return 1
    }

    if (value1.b != 300.0) {
        return 2
    }

    var value2: Data = Data(400)
    if (value2.a != 400) {
        return 3
    }
    if (value2.b != 300.0) {
        return 4
    }

    var value3: Data = Data(500, 600.0)
    if (value3.a != 500) {
        return 5
    }
    if (value3.b != 600.0) {
        return 6
    }
    return 0
}

main(): Int64 {
    return run()
}
