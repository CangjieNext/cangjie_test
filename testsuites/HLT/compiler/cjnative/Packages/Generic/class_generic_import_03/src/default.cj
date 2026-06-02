/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.A
import p1.B as Boo

main(): Int64 {
    if (A<Int64>.a != 1) {
        return 1
    }
    var a = Boo<Int64>.a
    var r1 = match (a) {
        case Some(v) => v
        case None => 1
    }
    if (r1 != 1) {
        return 4
    }
    return 0
}
