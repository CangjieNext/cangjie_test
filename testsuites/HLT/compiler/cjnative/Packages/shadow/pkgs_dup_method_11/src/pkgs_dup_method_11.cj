/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga.add
import pkgb
import pkga

func run(): Int64 {
    var res1: Int32 = pkga.add(2, 3)
    var res2: Int32 = pkgb.add(3, 4)
    if (res1 == 5 && res2 == 8) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
