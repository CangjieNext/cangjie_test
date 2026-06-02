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

import pkgs

main(): Int64 {
    return run()
}

struct Data {
    public let width: Int32
    public let length: Int32
    public Data(width1: Int32, length1: Int32) {
        width = length1
        length = width1
    }
    public func area(): Int32 {
        return width * length
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: Data = Data(a, b)
    let data2: pkgs.Data = pkgs.Data(a, b)
    if (data1.area() == 12 && data2.area() == 3) {
        return 0
    }
    return 1
}
