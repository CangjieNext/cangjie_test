/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle %f -o %output 2>&1 | compare %f

import p1.aoo
import p1.boo as B

main(): Int64 {
    var r1 = aoo
    var r2 = B<Int32>
    return 0
}
// ASSERT: scan sema_generic_func_without_type_arg
// ASSERT: scan sema_generic_argument_no_match
