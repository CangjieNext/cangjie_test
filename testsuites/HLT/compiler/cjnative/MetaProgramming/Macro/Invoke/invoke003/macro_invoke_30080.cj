/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_macro test.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_macro_opt %run_args

import test.*

var flag = false

main() {
    @M(match (1) {
    case x : Int64 => 1
    case None(Int64) => 2
    case a => 3
    case _ if (true) => 4
    })
    if (flag) {
        return 0
    } else {
        return 1
    }
}
