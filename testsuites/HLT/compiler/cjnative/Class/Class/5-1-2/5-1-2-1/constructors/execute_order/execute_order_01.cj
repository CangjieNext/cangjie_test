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
    public var a: Int32
    public init() {
        a = 10
    }
}

class DataB <: DataA {
    public var b: Int32
    public init() {
        b = 20
    }
}

func run(): Int64 {
    var value1: DataB = DataB()
    if (value1.a != 10) {
        return 1
    }
    if (value1.b != 20) {
        return 2
    }
    return 0
}

main(): Int64 {
    return run()
}
