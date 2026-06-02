/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package p2

import p1.*

main() {
    var obj = C1()
    if (obj.c2 != 2) {
        return 1
    }
    if (C1.c1 != 1) {
        return 2
    }
    var result = foo()
    if (result != 1) {
        return 3
    }
    return 0
}
