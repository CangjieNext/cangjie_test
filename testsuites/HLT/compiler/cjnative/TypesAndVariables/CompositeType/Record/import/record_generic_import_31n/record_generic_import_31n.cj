/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkgs pkga
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgs/pkgs.cj -o pkgs/pkgs.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/pkga.cj -o pkga/pkga.%middle
// EXEC: %compiler %cmp_opt %f pkgs/pkgs.%middle pkga/pkga.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgs
import pkga

main(): Int64 {
    return run()
}

func run(): Int64 {
    var res: Int32
    var a: Int32 = 3
    var b: Int32 = 4
    let data: pkga.Data<Int32> = pkga.Data<Int32>(a, b)
    let data2: pkgs.Data<Int32> = pkgs.Data<Int32>(a, b)
    res = data.area()
    if (res == 3) {
        return 0
    }
    return 1
}
