/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../a 
// EXEC: %compiler %cmp_opt %compile_lib_opt ./a/operator_overloading_00705a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f a.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package b

import a.*

main(): Int64 {
    var i: A = A()
    if (!i) {
        return 0
    }
    return 1
}
