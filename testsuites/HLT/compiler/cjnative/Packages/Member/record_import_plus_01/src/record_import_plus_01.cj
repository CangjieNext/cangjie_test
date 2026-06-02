/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o ./pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/pkgb.cj pkga.%middle   -o ./pkgb.%middle
// EXEC: %compiler %cmp_opt %f   pkga.%middle pkgb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga.*
import pkgb

func coo(): Int64 {
    var c0: Int64 = 2
    var c1: Data_a<Int64> = Data_a<Int64>(c0, c0)
    var c: pkgb.Data_b<Int64> = pkgb.Data_b<Int64>(c0, c0, c1)
    if (c.area() != 2) {
        return 1
    }
    return 0
}

func run(): Int64 {
    let x: Int64 = pkgb.boo()
    let y: Int64 = coo()
    if (x != 0) {
        return 1
    }
    if (y != 0) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
