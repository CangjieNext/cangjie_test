/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../mod1
// EXEC-PIPE: %compiler %cmp_opt %pkg_opt ./mod1/src/p1 %compile_lib_opt -o p1.%middle 2>&1 | compare %f

import p1.foo

main(): Int64 {
    var a = foo(Int8(1))
    if (a != 11) {
        return 1
    }
    return 0
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_dce_unused_function
