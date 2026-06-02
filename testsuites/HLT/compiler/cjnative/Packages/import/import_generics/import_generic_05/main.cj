/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p
// EXEC: %compiler %cmp_opt %compile_lib_opt p/a.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan This function is defined in Cangjie.
// ASSERT: scan This function is defined with CFunc lambda.

import a.*

main(): Int64 {
    unsafe {
        callableInC()
        f1()
    }
    0
}
