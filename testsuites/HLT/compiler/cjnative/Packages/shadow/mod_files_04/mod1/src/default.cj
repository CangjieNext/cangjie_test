/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src/p1 -o ./p1.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src/p2 -o ./p2.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src ./p1.%middle ./p2.%middle

package d

import p1.*
import p2.a2 as a

main(): Int64 {
    var a = a1
    var b = a
    return 0
}
