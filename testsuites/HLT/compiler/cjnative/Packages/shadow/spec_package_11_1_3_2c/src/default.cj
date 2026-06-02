/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1 p2
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.f1 as f // Ok, overloaded.
import p2.f2 as f // Ok, overloaded

func f(a: Int32) {
    return 3
} // Ok, overloaded.

main() {
    if (f(1) != 3) {
        return 1
    }
    return 0
}
