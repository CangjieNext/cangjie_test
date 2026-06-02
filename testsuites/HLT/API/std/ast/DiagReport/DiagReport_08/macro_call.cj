/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: macro_definition.cj
// EXEC: %compiler %cmp_macro macro_definition.cj
// EXEC-PIPE: %compiler %cmp_opt --warn-off all %f -o %output  2>&1 | compare %f
// ASSERT: scan-not warning

package macro_calling

import std.ast.*
import macro_definition.*

@TestDef(public var a: Int64 = 1)

main() {
    let a = 1
}
