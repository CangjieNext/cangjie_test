/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg1.cj pkg.cfg1
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt  %f pkg1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

package pkg2

import pkg1

func run(): Int64 {
    if (pkg1.Base.get() != 1) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
