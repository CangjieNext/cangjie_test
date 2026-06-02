/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../mod1
// EXEC: %compiler %cmp_opt %compile_lib_opt ./mod1/src/p1/*.cj -o mod1/a.%middle 
// EXEC: %compiler %cmp_opt %compile_lib_opt ./mod1/src/*.cj mod1/a.%middle -o mod1/pkgDefault.%middle 
// EXEC-PIPE: %ls mod1 2>&1 | compare %f
// ASSERT: scan pkgDefault.cjo

// When using package compilation method, the package under src can be exported and imported. But main redefinition error
// will be reported when linking the .o file of different package under src, even though the package name under src is not default.

import mod1.p1.*
import mod1.pkgDefault.*

main(): Int64 {
    var a = foo(Int8(1))
    if (a != 11) {
        return 1
    }
    return 0
}
