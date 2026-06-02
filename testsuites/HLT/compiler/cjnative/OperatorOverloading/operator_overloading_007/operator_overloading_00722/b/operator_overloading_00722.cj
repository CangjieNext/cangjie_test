/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../a
// EXEC: %compiler %cmp_opt %compile_lib_opt ./a/operator_overloading_00722a.cj -o ./operator_overloading_00722a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f ./operator_overloading_00722a.%middle -o %output 2>&1 | compare %f

package b

import a

extend a.A <: a.update {
    public operator func !(): Bool {
        true
    }
}

main(): Int64 {
    var i: a.A = a.A()
    if (!i) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_type_cannot_extend_imported_interface
