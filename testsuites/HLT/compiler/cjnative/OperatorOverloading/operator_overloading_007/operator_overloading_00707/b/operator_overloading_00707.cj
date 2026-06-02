/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../a
// EXEC: %compiler %cmp_opt %compile_lib_opt ./a/operator_overloading_00707a.cj -o ./a/operator_overloading_00707a.%middle

package b

import a

main(): Int64 {
    var i: a.A = a.A()
    if (!i) {
        return 0
    }
    return 1
}
