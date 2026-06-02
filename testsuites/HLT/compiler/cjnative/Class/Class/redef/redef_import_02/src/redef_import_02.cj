/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/b.cj a.%middle -o b.%middle
// EXEC: %compiler %cmp_opt src/%f a.%middle b.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgb.Coo
import pkga.Boo

main(): Int64 {
    if (Coo.foo<Int32>(1, 2) != 2 || Boo<Int32>.foo<Int64>(3, 1) != 1) {
        return 1
    }
    return 0
}
