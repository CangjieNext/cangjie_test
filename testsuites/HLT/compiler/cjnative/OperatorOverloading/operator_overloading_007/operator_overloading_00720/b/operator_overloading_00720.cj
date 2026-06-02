/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../a
// EXEC: %compiler %cmp_opt %compile_lib_opt ./a/operator_overloading_00720a.cj -o ./a/operator_overloading_00720a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f --import-path=./a ./a/operator_overloading_00720a.%middle -o %output 2>&1 | compare %f

package b

import a.*

interface update {
    operator func !(): Bool
}

extend Int32 <: update {
    public operator func !(): Bool {
        return true
    }
}

main(): Int64 {
    var i = A()
    if (!i) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_operator_overload_built_in_unary_operator
