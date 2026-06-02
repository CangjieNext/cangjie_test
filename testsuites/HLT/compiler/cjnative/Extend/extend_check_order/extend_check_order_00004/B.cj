/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkgA
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgA/A.cj -o pkgA.%middle
// ERRCHECK: %compiler %cmp_opt %f pkgA.%middle -o %output
// ASSERT: scan-2 sema_type_cannot_extend_imported_interface

import pkgA.*

extend String <: I2 {}

extend String <: I1 {}

main(): Int64 {
    var res = "aaa".foo()
    if (res != 2) {
        return 1
    }
    0
}
