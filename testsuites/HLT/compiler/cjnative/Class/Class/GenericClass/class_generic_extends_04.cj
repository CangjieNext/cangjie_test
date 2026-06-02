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
    public var b: Int32 = 4
}

class Data<T> <: Base {
    public var count: T
    public init(x: T) {
        count = x
    }
}

main(): Int64 {
    var data: Data<Int32> = Data<Int32>(2)
    if (data.count == 2 && data.b == 4) {
        return 0
    }
    return 1
}
