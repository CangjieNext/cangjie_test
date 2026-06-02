/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src/p1 -o ./libp1.%middle %compile_lib_opt
// ERRCHECK: %compiler %cmp_opt %pkg_opt ./mod1/src libp1.%middle -o .
package d

import p1.*

main(a: Array<Int64>) {
    var aNew = a1
    var b = aNew
    0
}
// ASSERT: scan sema_unexpected_param_for_entry
