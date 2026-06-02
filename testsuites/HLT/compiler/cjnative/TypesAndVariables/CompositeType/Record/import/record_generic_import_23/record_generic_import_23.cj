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

var Data: Int32 = 4

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: Int32 = Data
    let data2: pkgs.Data<Int32> = pkgs.Data<Int32>(a, b)
    if (data1 == 4 && data2.area() == 3) {
        return 0
    }
    return 1
}
