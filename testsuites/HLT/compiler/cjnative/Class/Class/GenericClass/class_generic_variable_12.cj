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

open class Base<T> {
    public var base: T
    public init(x: T) {
        base = x
    }
}

class Data<T> <: Base<Int32> {
    public init(input: T) {
        super(3)
    }
}

main(): Int64 {
    var i1: Int32 = 5
    var data: Data<Int32> = Data<Int32>(i1)
    var res: Int32 = data.base
    if (res == 3) {
        return 0
    }
    return 1
}
