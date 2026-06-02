/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkgs pkga
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkgs.%middle pkga.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga
import pkgs
import pkga.Data

main(): Int64 {
    return run()
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: pkgs.Data = pkgs.Data(a, b)
    let data2: pkga.Data = pkga.Data(a, b)
    var res1: Int32 = data1.area()
    var res2: Int32 = data2.area()
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}
