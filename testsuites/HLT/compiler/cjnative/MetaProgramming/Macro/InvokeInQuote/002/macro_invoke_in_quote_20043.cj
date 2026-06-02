/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_20043.cj
// EXEC: %compiler %cmp_macro define_20043.cj
// EXEC-PIPE: %compiler %cmp_opt %f  -o %output | compare %f
// RUN-EXEC: %run %run_opt %output
// ASSERT: scan oh!

package use

import std.ast.*
import define_20043.*

main() {
    quote($(@X[1](1)))
    return 0
}
// ASSERT: regex-not no position error occurred
