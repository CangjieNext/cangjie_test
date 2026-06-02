/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: macro_definition.cj
// EXEC: %compiler --compile-macro macro_definition.cj
// ERRCHECK: %compiler --warn-off all %f -o %output  2>&1 | compare %f
// ASSERT: scan ASTException: The range of input tokens is out of the macro call range.

package macro_calling

import std.ast.*
import macro_definition.*

@TestDef(public var a: Int64 = 1)

main() {
    let a = 1
}
