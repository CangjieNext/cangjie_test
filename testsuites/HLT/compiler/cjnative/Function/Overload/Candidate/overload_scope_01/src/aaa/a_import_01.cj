/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/eee/e_01.cj -o eee.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/ddd/d_01.cj eee.%middle -o ddd.%middle
// ERRCHECK: %compiler %cmp_opt %f ddd.%middle eee.%middle -o %output

package aaa

import ddd

main(): Int64 {
    var a = foo()

    return 0
}
// ASSERT: scan sema_undeclared_identifier
