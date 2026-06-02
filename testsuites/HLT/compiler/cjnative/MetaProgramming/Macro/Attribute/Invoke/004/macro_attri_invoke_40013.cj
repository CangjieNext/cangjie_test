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
    @M[-1e-2](-1e-2)
    @M[-.1e-1](-.1e-1)
    @M[-1.1](-1.1)
    @M[-1.1e-1](-1.1e-1)
    @M[-0xFP-1](-0xFP-1)
    @M[-0x.FP-1](-0x.FP-1)
    @M[-0xf.FP-1](-0xf.FP-1)
    return 0
}
