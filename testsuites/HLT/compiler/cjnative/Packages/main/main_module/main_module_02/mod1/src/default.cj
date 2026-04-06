/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt %pkg_opt %compile_lib_opt ./mod1/src/p1 -o ./p1.%middle
// (not iOS) EXEC-PIPE-1: %compiler %cmp_opt %pkg_opt ./mod1/src p1.%middle -o . 2>&1 | compare %f
// (iOS) EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src p1.%middle -o .

import p1.foo

func goo(): Int64 {
    var a = foo(Int8(1))
    if (a != 11) {
        return 1
    }
    return 0
}
// (not iOS) ASSERT: scan sema_missing_entry
