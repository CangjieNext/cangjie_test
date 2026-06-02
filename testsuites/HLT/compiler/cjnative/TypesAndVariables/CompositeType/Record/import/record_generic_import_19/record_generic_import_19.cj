/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkgs
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f pkgs.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgs.Data
import pkgs

main(): Int64 {
    return run()
}

class Data<T> {
    public let width: T
    public let length: T
    public init(width1: T, length1: T, c: Int32) {
        width = length1
        length = width1
    }
    public func area(): T {
        return width
    }
}

func run(): Int64 {
    var res: Int32
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: Data<Int32> = Data<Int32>(a, b, b)
    let data2: pkgs.Data<Int32> = pkgs.Data<Int32>(a, b)
    if (data1.area() == 4 && data2.area() == 3) {
        return 0
    }
    return 1
}
