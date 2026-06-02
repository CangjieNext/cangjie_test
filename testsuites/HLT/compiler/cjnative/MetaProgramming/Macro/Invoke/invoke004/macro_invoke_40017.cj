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
    var ab = 1
    var a_b = 1
    var a1 = 1
    var ab_1 = 1
    var `c` = 1
    var `c1` = 1
    var `c_` = 1
    var `cd_1` = 1
    @M(ab)
    @M(a_b)
    @M(a1)
    @M(ab_1)
    @M(`c`)
    @M(`c1`)
    @M(`c_`)
    @M(`cd_1`)
    return 0
}
