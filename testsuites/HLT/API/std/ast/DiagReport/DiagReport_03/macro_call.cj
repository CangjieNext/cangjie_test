/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: macro_definition.cj
// ERRCHECK: %compiler %cmp_opt %cmp_macro macro_definition.cj
// ASSERT: scan "sema_undeclared_identifier"

package macro_calling

import std.ast.*
import macro_definition.*

@TestDef()

main() {
    let a = 1
    return 0
}
