/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC-PIPE-1: %compiler  %cmp_opt %pkg_opt ./src/pkga %compile_lib_opt -o ./ 2>&1 | compare %f

import pkga.*

main(): Int64 {
    let a: Int32 = pkga.one
    if (a != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan package_import_itself_illegal
