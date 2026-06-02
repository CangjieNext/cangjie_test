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
    @M[-0xF](-0xF)
    @M[-0Xf](-0Xf)
    @M[0x1](0x1)
    @M[-0xa_](-0xa_)
    @M[-0xb_c](-0xb_c)
    @M[-0x0__1](-0x0__1)
    @M[-0x5678](-0x5678)
    @M[-0xd_e_f_9_](-0xd_e_f_9_)
    @M[+0x123](+0x123)
    @M[--0x0](--0x0)
    return 0
}
