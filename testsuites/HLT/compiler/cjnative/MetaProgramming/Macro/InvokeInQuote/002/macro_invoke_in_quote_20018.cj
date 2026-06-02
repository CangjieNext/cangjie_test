/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_20018.cj
// (not iOS) EXEC: %compiler %cmp_opt define_20018.cj %cmp_macro
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC-PIPE: %run %run_opt %output | compare %f
// ASSERT: scan at
package use

import std.ast.*
import define_20018.*

main() {
    var a = quote(\@
    X[1](1))
    a.dump()
    return 0
}
