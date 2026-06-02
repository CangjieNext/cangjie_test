/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f %macro_debug -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_macro_opt %run_args | compare %f
// ASSERT: scan token_literal_value: 12345

package use

import define.*
import std.ast.*

main() {
    @SAME var A = quote(12345)
    A.dump()
    return 0
}
