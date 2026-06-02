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
    public var a: Int32
    public var b: Float32

    public init(value1: Int32, value2: Float32) {
        a = value1
        b = value2
    }
}

class Data <: Base {
    public var c: Int32 = 1
    public var d: Int32 = 2

    public init(value1: Int32) {
        super(200, 20.0)
        c = value1
        d = 4
    }

    public init() {
        this(3)
    }
}

func run(): Int64 {
    var value1: Data = Data()
    if (value1.a != 200) {
        return 1
    }
    if (value1.b != 20.0) {
        return 2
    }
    if (value1.c != 3) {
        return 3
    }
    if (value1.d != 4) {
        return 4
    }
    return 0
}

main(): Int64 {
    return run()
}
