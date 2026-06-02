/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt  pkg.cj %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package class_var_def_static

func run(): Int64 {
    var test: Int64 = Data.a
    if (test != 1) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
