/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Base {
    public static func foo(x: Int32) {
        return x
    }
}

class Data <: Base {
    public var b: Int32
    public init(x: Int32) {
        b = foo(2)
    }
}

func run(): Int64 {
    var data: Data = Data(3)
    if (data.b != 2) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
