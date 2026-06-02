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
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/pkgb.cj pkga.%middle  -o ./pkgb.%middle 
// EXEC: %compiler %cmp_opt %f   pkgb.%middle pkga.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgb

main(): Int64 {
    let c0: Int32 = 1
    let c: Int32 = pkgb.foo(c0)
    print(c.toString() + "\n")
    if (c != 48) {
        return 1
    }
    return 0
}
