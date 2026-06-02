/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../mod1
// EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src/p1 -o ./mod1/p1.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src ./mod1/p1.%middle -o ./mod1
// EXEC-PIPE: %ls ./mod1 2>&1 | compare %f
// ASSERT: scan-not default.cjo
// ASSERT: scan-not pkgDefault.cjo 

// When using module compilation method, the package under src cannot be exported and imported.

import mod1.p1.*
import mod1.pkgDefault.*

main(): Int64 {
    var a = foo(Int8(1))
    if (a != 11) {
        return 1
    }
    return 0
}
