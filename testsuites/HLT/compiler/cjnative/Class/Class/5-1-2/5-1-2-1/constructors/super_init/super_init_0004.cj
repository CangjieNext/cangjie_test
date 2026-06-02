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

open class Base {
    public var a: Int32 = 100
    public var b: Float32 = 10.0
}

class Data <: Base {
    public var c: Int32 = 1
    public init() {
        c = a + 200
    }
}

func run(): Int64 {
    var value1: Data = Data()
    if (value1.a != 100) {
        return 1
    }
    if (value1.b != 10.0) {
        return 2
    }
    if (value1.c != 300) {
        return 3
    }
    return 0
}

main(): Int64 {
    return run()
}
