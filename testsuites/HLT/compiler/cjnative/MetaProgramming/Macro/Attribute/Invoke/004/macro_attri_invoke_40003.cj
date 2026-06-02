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
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_macro_opt %run_args

import test.*

main() {
    @M[-0b0](-0b0)
    @M[-0B1](-0B1)
    @M[0b1](0b1)
    @M[-0b0_](-0b0_)
    @M[-0b0_1](-0b0_1)
    @M[-0b0__1](-0b0__1)
    @M[-0b0110](-0b0110)
    @M[-0b0_1_1_0_](-0b0_1_1_0_)
    @M[+0b000](+0b000)
    @M[--0b0](--0b0)
    return 0
}
