/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1 p2
// EXEC: %compiler %cmp_opt %compile_lib_opt p1/file1.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt p2/*.cj  p1.%middle -o p2.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle p2.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.*
import p2.*

main(): Int64 {
    if (result1 != 1) {
        return 1
    }
    if (result2 != 1) {
        return 1
    }
    return 0
}
