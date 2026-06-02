/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga
import pkgb

func run(): Int64 {
    var timea = pkga.TimeUnit<Int32>.Hour(5)
    var resa: Int32 = match (timea) {
        case Hour(x) => 1
    }
    var timeb = pkgb.TimeUnit
    var resb: Int32 = timeb
    if (resa + resb == 3) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
