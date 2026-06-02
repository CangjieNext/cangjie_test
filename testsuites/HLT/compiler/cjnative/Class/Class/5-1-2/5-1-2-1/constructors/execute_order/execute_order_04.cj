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

open class DataA {
    public var a: Int32 = 1
    public init() {
        a = a + 1
    }
}

open class DataB <: DataA {
    public var b: Int32
    public init() {
        b = 20
    }
}

open class DataC <: DataA {
    public var b: Int32
    public init() {
        b = 30
    }
}

class DataD <: DataA {
    public var b: Int32
    public init() {
        b = 40
    }
}

func run(): Int64 {
    var value1: DataB = DataB()
    if (value1.a != 2) {
        return 1
    }

    if ((value1.b != 20)) {
        return 2
    }

    var value2: DataC = DataC()
    if (value2.a != 2) {
        return 3
    }

    if (value2.b != 30) {
        return 4
    }

    var value3: DataD = DataD()
    if (value3.a != 2) {
        return 5
    }

    if ((value3.b != 40)) {
        return 6
    }

    return 0
}

main(): Int64 {
    return run()
}
