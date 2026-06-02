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
    public static var b: Int32 = 3
}

main(): Int64 {
    var base: Base<Int32> = Base<Int32>()
    var res: Int32 = Data<Int32>.b
    if (res == 3) {
        return 0
    }
    return 1
}
