/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: module1
// EXEC: %compiler %cmp_opt %compile_lib_opt module1/src/pkgs/pkgs.cj -o module1/pkgs.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f  module1/pkgs.%middle -o %output 2>&1 | compare %f

import module1.pkgs.Data

main(): Int64 {
    var data: D = Data()
    if (data.i == 2) {
        return 0
    }
    return 1
}

// ASSERT: scan sema_undeclared_type_name
