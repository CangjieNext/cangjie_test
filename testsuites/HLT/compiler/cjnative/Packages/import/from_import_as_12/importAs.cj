/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
//DEPENDENCE: ./pkg1
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/pkg1.cj -o pkg1.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkg1.%middle -o %output 2>&1 | compare %f

import pkg1 as renmae

main(): Int64 {
    var b = renmae.A()
    return a - 1
}
// ASSERT: scan sema_undeclared_identifier
