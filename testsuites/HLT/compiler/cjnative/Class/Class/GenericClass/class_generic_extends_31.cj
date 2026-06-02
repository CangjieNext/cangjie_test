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
    public var a: Int32 = 2
}

class Data<T> <: Base<T> {
    public init() {
        super()
        a = 3
    }
}

main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    var castOP = data as Base<Int32> // Data->Base
    var res: Int32 = data.a
    if (res == 3) {
        return 0
    }
    return 1
}
