/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_10015.cj
// EXEC: %compiler %cmp_macro define_10015.cj
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output | compare %f
// ASSERT: scan description: at
// ASSERT: scan description: sub
package use

import std.ast.*
import define_10015.*

main() {
    var a = quote(@M var x : Int64 = 1 1 - 1)
    a.dump()
    return 0
}
